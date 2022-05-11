const { Pool } = require('pg');


// Conexion local
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    password: '123456789',
    database: 'autenticacion',
    port: '5432'
});


//Conexión a Postgres heroku
/* process.env.DATABASE_URL = 'postgres://yurmkyxwvuozrr:512fc9b1da40e905cb6219292d72058824f7c34f02166c6f1da4319eb17e3352@ec2-3-222-49-168.compute-1.amazonaws.com:5432/dc4pailb7l1f52';
const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false
    }
}); */

const getUsers = async(req, res) => {
    const response = await pool.query('SELECT * FROM usuario ORDER BY id_usuario ASC');
    res.status(200).json(response.rows);
};

const getUserById = async(req, res) => {
    const id = parseInt(req.params.id);
    const response = await pool.query('SELECT * FROM usuario WHERE id_usuario = $1', [id]);
    res.json(response.rows);
};

const createUser = async(req, res) => {
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
        password ,
        tipo_letra,
        madre,
        mascota,
        fruta} = req.body;
    await pool.query('INSERT INTO usuario (id_gen,apellidos,nombres,cedula,edad,nacimiento,email,telefono,ciudad,direccion,usuario,password) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)', [genero, apellidos, nombres, cedula, edad, fecha, email, movil, ciudad, direccion, usuario, password]);
    const response = await pool.query('SELECT id_usuario FROM usuario WHERE cedula = $1', [cedula]);
    let idUsuario = response.rows[0].id_usuario;
    await pool.query('INSERT INTO autenticacion (madre,mascota,fruta,tipo_letra,id_usuario) VALUES ($1, $2, $3, $4, $5)', [madre,mascota,fruta,tipo_letra,idUsuario]);

    res.json({
        message: 'Usuario registrado',
        estado: true,
        body: {
            user: { genero, apellidos, nombres, cedula, edad, fecha, email, movil, ciudad, direccion, usuario, password }
        }
    })
};

const deleteUser = async(req, res) => {
    const id = parseInt(req.params.id);
    await pool.query('DELETE FROM usuario where id = $1', [
        id
    ]);
    res.json(`User ${id} deleted Successfully`);
};

const updateUser = async(req, res) => {
    const id = parseInt(req.params.id);
    const { apellidos, nombres, cedula, email, telefono, ciudad, direccion  } = req.body;

    const response = await pool.query('UPDATE usuario SET apellidos = $1, nombres = $2 cedula = $3 email = $4 telefono = $5 ciudad = $6 direccion = $7 WHERE id_usuario = $8', [
        apellidos,
        nombres,
        cedula,
        email,
        telefono,
        ciudad,
        direccion,
        id_usuario
    ]);
    res.json('User Updated Successfully');
};

const getData = async(req, res) => {
    let usuario = JSON.parse(req.params.user);
    const data = await pool.query('SELECT * FROM autenticacion WHERE id_usuario = $1', [usuario.id_usuario]);
    let madre = data.rows[0].madre
    let mascota = data.rows[0].mascota
    let fruta = data.rows[0].fruta
    let vocales,consonantes;

    if (data.rows[0].tipo_letra === 'V') {
        vocales = [
            {nombre:'madre', data: eliminarRepetidos(madre.match(/[aeiouáéíóú]/gi))},
            {nombre:'mascota', data: eliminarRepetidos(mascota.match(/[aeiouóáéíóú]/gi))},
            {nombre:'fruta', data: eliminarRepetidos(fruta.match(/[aeiouóáéíóú]/gi))}
        ]
        console.log(obtenerAleatorio(vocales));
    } else if(data.rows[0].tipo_letra === 'C') {
        consonantes = [
            {nombre:'madre', data: eliminarRepetidos(madre.match(/[bcdfghjklñmnpqrstvwqyz]/gi))},
            {nombre:'mascota', data: eliminarRepetidos(mascota.match(/[bcdfghjklñmnpqrstvwqyz]/gi))},
            {nombre:'fruta', data: eliminarRepetidos(fruta.match(/[bcdfghjklñmnpqrstvwqyz]/gi))}
        ]
        console.log(obtenerAleatorio(consonantes));
            
        
    }
    
    const response = await pool.query('SELECT * FROM data');
    
    res.status(200).json(response.rows);
}

function eliminarRepetidos(data){
    let result = data.filter((item,index)=>{
        return data.indexOf(item) === index;
      })
      return result
}
function obtenerAleatorio(myArray){
    var rand = Math.floor(Math.random()*myArray.length);
    var rValue = myArray[rand];
    return rValue
}
module.exports = {
    getUsers,
    getUserById,
    createUser,
    deleteUser,
    updateUser,
    getData
};