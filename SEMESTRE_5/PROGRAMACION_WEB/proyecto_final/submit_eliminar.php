<?php
    //conexion a la base datos
    include "conexion.php";
    mysqli_set_charset($conexion,'utf8');

    //declaracion de varibales para formulario
    $buscarUsuario = "SELECT * FROM usuarios where 
                      correo = '$_POST[correo]'
                      and nombre_usuario = '$_POST[nombre_usuario]'
                      and password = '$_POST[password]'";
    $result = $conexion -> query($buscarUsuario);
    $count = mysqli_num_rows($result);

    if($count ==1 ){
        mysqli_query($conexion, "DELETE FROM usuarios WHERE nombre_usuario = '$_POST[nombre_usuario]' AND password = '$_POST[password]' ");

        echo "<br/><br/><br/>" . "<h1>" . "USUARIO ELIMINADO EXITOSAMENTE!" . "</h1>";
        echo "<br/><br/>"."<p>" . "<a href='./eliminar_usuario.php'>ELIMINAR OTRO USUARIO</a>" . "</p>";
        echo "<br/><br/>"."<p>" . "<a href='./index.html'>MENÚ PRINCIPAL</a>" . "</p>";
        
    }else{
        echo "<br/><br/><br/>" . "<h1>" . "LO SENTIMOS, USUARIO NO ENCONTRADO" . "</h1>";
        echo "<br/><br/>"."<p>" . "<a href='./index.html'>VOLVER A MENÚ PRINCIPAL</a>" . "</p>";
    //termina el else
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar</title>
    <link rel="stylesheet" href="recursos/css/estilo_submit_eliminar.css">
    <link rel="shortcut icon" href="recursos/img/logofavicon.jpg" type="image/x-icon">
</head>
<body>
    
</body>
</html>