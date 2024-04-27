<?php
    //conexion a la base datos
    include "conexion.php";
    mysqli_set_charset($conexion,'utf8');

    //declaracion de varibales para formulario
    $buscarUsuario = "SELECT * FROM usuarios where nombre_usuario = '$_POST[nombre_usuario]' AND password =  '$_POST[password]'";
    $result = $conexion -> query($buscarUsuario);
    $count = mysqli_num_rows($result);

    if($count ==1 ){
        echo "<br/><br/><br/>" . "<h1>" . "SESIÓN INICIADA" . "</h1>";
        echo "<br/><br/>"."<h2>" . "Bienvenido: " . $_POST['nombre_usuario'] . "</h2>" . "\n\n";
        echo "<br/><br/>"."<p>" . "<a href='./index.html'>VOLVER A MENÚ PRINCIPAL</a>" . "</p>";
        
    }else{
    echo "<br/><br/><br/>" . "<h1>" . "LO SENTIMOS, NO SE PUDO INICIAR SESION :(" . "</h1>";
    echo "<br/><br/>"."<p>" . "<a href='./iniciar_sesion.php'>VOLVER A INICIO DE SESIÓN</a>" . "</p>";
    echo "<br/><br/>"."<p>" . "<a href='./index.html'>VOLVER A MENÚ PRINCIPAL</a>" . "</p>";
    //termina el else
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicipo de sesion</title>
    <link rel="stylesheet" href="recursos/css/estilo_submit_registro.css">
    <link rel="shortcut icon" href="recursos/img/logofavicon.jpg" type="image/x-icon">
</head>
<body>
    
</body>
</html>