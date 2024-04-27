<?php
    //conexion a la base datos
    include "conexion.php";
    mysqli_set_charset($conexion,'utf8');

    //declaracion de varibales para formulario
    $buscarUsuario = "SELECT * FROM usuarios where nombre_usuario = '$_POST[nombre_usuario]'";
    $result = $conexion -> query($buscarUsuario);
    $count = mysqli_num_rows($result);

    if($count ==1 ){
        echo "<br/><br/><br/>" . "<h1>" . "LO SENTIMOS, EL USUARIO YA HA SIDO REGISTRADO" . "</h1>";
        echo "<br/><br/>"."<p>" . "<a href='./registrar_usuario.php'>VOLVER A REGISTRO DE USUARIO</a>" . "</p>";
        echo "<br/><br/>"."<p>" . "<a href='./index.html'>VOLVER A MENÚ PRINCIPAL</a>" . "</p>";
        
    }else{
        mysqli_query($conexion, "INSERT INTO usuarios (
        nombre,
        direccion,
        telefono,
        correo,
        nombre_usuario,
        password)
            VALUES(
        '$_POST[usuario]',
        '$_POST[direccion]',
        '$_POST[telefono]',
        '$_POST[correo]',
        '$_POST[nombre_usuario]',
        '$_POST[password]'        
        )");

    echo "<br/><br/><br/>" . "<h1>" . "USUARIO REGISTRADO EXITOSAMENTE!" . "</h1>";
    echo "<br/><br/>"."<h2>" . "Bienvenido: " . $_POST['usuario'] .", ahora estas registrado en nuestra base de datos :)". "</h2>" . "\n\n";
    echo "<br/><br/>"."<p>" . "<a href='./registrar_usuario.php'>VOLVER A REGISTRO DE USUARIO</a>" . "</p>";
    echo "<br/><br/>"."<p>" . "<a href='./index.html'>VOLVER A MENÚ PRINCIPAL</a>" . "</p>";
    //termina el else
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="recursos/css/estilo_submit_registro.css">
    <link rel="shortcut icon" href="recursos/img/logofavicon.jpg" type="image/x-icon">
</head>
<body>
    
</body>
</html>