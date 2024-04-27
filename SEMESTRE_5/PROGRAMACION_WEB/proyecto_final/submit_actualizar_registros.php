<?php
    //conexion a la base datos
    include "conexion.php";
    mysqli_set_charset($conexion,'utf8');

    //declaracion de varibales para formulario
    $buscarUsuario = "SELECT * FROM usuarios where nombre_usuario = '$_POST[nombre_usuario]'";
    $result = $conexion -> query($buscarUsuario);
    $count = mysqli_num_rows($result);

    if($count ==1 ){
        mysqli_query($conexion, "UPDATE usuarios 
             SET 
             nombre = '$_POST[usuario]',
             direccion = '$_POST[direccion]',
             telefono = '$_POST[telefono]',
             correo = '$_POST[correo]'            
             WHERE
             nombre_usuario = '$_POST[nombre_usuario]'");
    
        echo "<br/><br/><br/>" . "<h1>" . "DATOS ACTUALIZADOS EXITOSAMENTE!" . "</h1>";
        echo "<br/><br/>"."<p>" . "<a href='./index.html'>VOLVER A MENÚ PRINCIPAL</a>" . "</p>";
        
    }else{
        echo "<br/><br/><br/>" . "<h1>" . "LO SENTIMOS, HA OCURRIDO ALGUN ERROR" . "</h1>";
        echo "<br/><br/>"."<p>" . "<a href='./index.html'>VOLVER A MENÚ PRINCIPAL</a>" . "</p>";
    //termina el else
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizacion de datos</title>
    <link rel="stylesheet" href="recursos/css/estilo_submit_registro.css">
    <link rel="shortcut icon" href="recursos/img/logofavicon.jpg" type="image/x-icon">
</head>
<body>
    
</body>
</html>