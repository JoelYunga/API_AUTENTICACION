const { Pool } = require("pg");

// Conexion local
const pool = new Pool({
  user: "postgres",
  host: "localhost",
  password: "123",
  database: "autenticacion",
  port: "5432",
});

//Conexión a Postgres heroku
/* process.env.DATABASE_URL = 'postgres://rhtkexxqbytywf:0d763829183a64a532490899caf05b141c909e0475c8f399a53c5dab8223587f@ec2-3-229-11-55.compute-1.amazonaws.com:5432/d3sg9gsjam3hc4';
const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false
    }
}); */

const getUsers = async (req, res) => {
  const response = await pool.query(
    "SELECT * FROM usuario ORDER BY id_usuario ASC"
  );
  res.status(200).json(response.rows);
};

const getUserById = async (req, res) => {
  const id = parseInt(req.params.id);
  const response = await pool.query(
    "SELECT * FROM usuario WHERE id_usuario = $1",
    [id]
  );
  res.json(response.rows);
};

const createUser = async (req, res) => {
  const {
    genero,
    apellidos,
    nombres,
    cedula,
    edad,
    fecha,
    email,
    movil,
    ciudad,
    direccion,
    usuario,
    password,
    tipo_letra,
    madre,
    mascota,
    fruta,
  } = req.body;
  await pool.query(
    "INSERT INTO usuario (id_gen,apellidos,nombres,cedula,edad,nacimiento,email,telefono,ciudad,direccion,usuario,password) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)",
    [
      genero,
      apellidos,
      nombres,
      cedula,
      edad,
      fecha,
      email,
      movil,
      ciudad,
      direccion,
      usuario,
      password,
    ]
  );
  const response = await pool.query(
    "SELECT id_usuario FROM usuario WHERE cedula = $1",
    [cedula]
  );
  let idUsuario = response.rows[0].id_usuario;
  await pool.query(
    "INSERT INTO autenticacion (madre,mascota,fruta,tipo_letra,id_usuario) VALUES ($1, $2, $3, $4, $5)",
    [madre, mascota, fruta, tipo_letra, idUsuario]
  );

  res.json({
    message: "Usuario registrado",
    estado: true,
    body: {
      user: {
        genero,
        apellidos,
        nombres,
        cedula,
        edad,
        fecha,
        email,
        movil,
        ciudad,
        direccion,
        usuario,
        password,
      },
    },
  });
};

const deleteUser = async (req, res) => {
  const id = parseInt(req.params.id);
  await pool.query("DELETE FROM usuario where id = $1", [id]);
  res.json(`User ${id} deleted Successfully`);
};

const updateUser = async (req, res) => {
  const id = parseInt(req.params.id);
  const { apellidos, nombres, cedula, email, telefono, ciudad, direccion } =
    req.body;

  const response = await pool.query(
    "UPDATE usuario SET apellidos = $1, nombres = $2 cedula = $3 email = $4 telefono = $5 ciudad = $6 direccion = $7 WHERE id_usuario = $8",
    [apellidos, nombres, cedula, email, telefono, ciudad, direccion, id_usuario]
  );
  res.json("User Updated Successfully");
};

const getData = async (req, res) => {
  let usuario = JSON.parse(req.params.user);
  const data = await pool.query(
    "SELECT * FROM autenticacion WHERE id_usuario = $1",
    [usuario.id_usuario]
  );
  let madre = data.rows[0].madre.toUpperCase();
  let mascota = data.rows[0].mascota.toUpperCase();
  let fruta = data.rows[0].fruta.toUpperCase();
  let auth;
  let pista;
  if (data.rows[0].tipo_letra === "V") {
    let vocales = [
      {
        nombre: "madre",
        data: eliminarRepetidos(removeAccents(madre).match(/[aeiou]/gi)),
      },
      {
        nombre: "mascota",
        data: eliminarRepetidos(
          removeAccents(mascota).match(/[aeiouóáéíóú]/gi)
        ),
      },
      {
        nombre: "fruta",
        data: eliminarRepetidos(removeAccents(fruta).match(/[aeiouóáéíóú]/gi)),
      },
    ];
    auth = obtenerAleatorio(vocales);

    if (auth.nombre === "madre") {
      pista = "Nombre de tu Madre";
    } else if (auth.nombre === "mascota") {
      pista = "Nombre de tu Mascota";
    } else if (auth.nombre === "fruta") {
      pista = "Nombre de tu Fruta Favorita";
    }
  } else if (data.rows[0].tipo_letra === "C") {
    let consonantes = [
      {
        nombre: "madre",
        data: eliminarRepetidos(madre.match(/[bcdfghjklñmnpqrstvwqyz]/gi)),
      },
      {
        nombre: "mascota",
        data: eliminarRepetidos(mascota.match(/[bcdfghjklñmnpqrstvwqyz]/gi)),
      },
      {
        nombre: "fruta",
        data: eliminarRepetidos(fruta.match(/[bcdfghjklñmnpqrstvwqyz]/gi)),
      },
    ];
    auth = obtenerAleatorio(consonantes);
    if (auth.nombre === "madre") {
      pista = "Nombre de tu Madre";
    } else if (auth.nombre === "mascota") {
      pista = "Nombre de tu Mascota";
    } else if (auth.nombre === "fruta") {
      pista = "Nombre de tu Fruta Favorita";
    }
  }
  const response = await pool.query("SELECT * FROM data");
  let datos = response.rows;
  let a = compararArrays(datos, auth.data);
  let noElegiblesTotales = eliminarRepetidosArrays2(datos, a);
  let elegibles = extraerDatos(4, compararArrays(datos, auth.data));
  for (const i of elegibles) {
    i.estado = true;
  }
  let noElegibles = extraerDatos(5, eliminarRepetidosArrays(noElegiblesTotales, elegibles));
  for (const i of noElegibles) {
    i.estado = false;
  }
  let resultado = elegibles.concat(noElegibles);
  aleatorizarArray(resultado);

  res.status(200).json({ resultado, pista });
};

function eliminarRepetidos(data) {
  let result = data.filter((item, index) => {
    return data.indexOf(item) === index;
  });
  return result;
}
function aleatorizarArray(inputArray) {
  inputArray.sort(() => Math.random() - 0.5);
}
function obtenerAleatorio(myArray) {
  var rand = Math.floor(Math.random() * myArray.length);
  var rValue = myArray[rand];
  return rValue;
}
const removeAccents = (str) => {
  return str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
};

function compararArrays(data1, data2) {
  let data3 = [];
  data1.filter((d) => {
    data2.filter((s) => {
      if (d.letra === s) {
        data3.push(d);
      }
    });
  });
  return data3;
}
function eliminarRepetidosArrays2(data1, data2) {
  var array = [];
  for (var i = 0; i < data1.length; i++) {
    var igual = false;
    for (var j = 0; (j < data2.length) & !igual; j++) {
      if (
        data1[i]["id"] == data2[j]["id"] &&
        data1[i]["nombre"] == data2[j]["nombre"]
      )
        igual = true;
    }
    if (!igual) array.push(data1[i]);
  }
  /* console.log(JSON.stringify(array)); */
  return array
}
function eliminarRepetidosArrays() {
  var args = Array.prototype.slice.call(arguments),
    arr = args.shift().splice(0);
  args.forEach(function (arrN) {
    arrN.forEach(function (objN) {
      for (var i = 0; i < arr.length; i++) {
        if (JSON.stringify(arr[i]) === JSON.stringify(objN)) {
          arr.splice(i, 1);
          break;
        }
      }
    });
  });
  return arr;
}

function extraerDatos(numero, myArray) {
  var cuatroRandom = [];
  var posicionesElegibles = [];
  var i, r;
  for (i = 0; i < myArray.length; i++) {
    posicionesElegibles[i] = i;
  }
  for (i = 0; i < numero; i++) {
    r = Math.floor(Math.random() * posicionesElegibles.length);
    cuatroRandom.push(myArray[posicionesElegibles[r]]);
    posicionesElegibles.splice(r, 1);
  }
  return cuatroRandom;
}

module.exports = {
  getUsers,
  getUserById,
  createUser,
  deleteUser,
  updateUser,
  getData,
};
