<?php
// se usa el requiere para si psi se necesita el archivo conexion
require "conexion.php";
mysqli_set_charset($conexion,'utf8');


//genear el query
$consulta_sql="SELECT * FROM usuarios";

//mandar el query por medio de la conexion y almacenaremos el resultado en una variable
$resultado = $conexion->query($consulta_sql);

// Retorna el numero de filas del resultado. Si encuentra mas de uno lo usamos para imprimir el resultado en nuestra tabla
$count = mysqli_num_rows($resultado); 
 
echo "

    <br> <br> <br> <br> <br>
    <table border='2' >
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Telefono</th>
        <th>E-Mail</th>
        <th>Nombre de usuario</th>   
    </tr>";

if ( $count>0 ){
    //aqui se pintarian los registro de la DB
    while( $row = mysqli_fetch_assoc($resultado)  ){
     echo "<tr>";
        echo"<td>". $row['id'] ."</td>";
        echo"<td>". $row['nombre'] ."</td>";
        echo"<td>". $row['telefono'] ."</td>";
        echo"<td>". $row['correo'] ."</td>";
        echo"<td>". $row['nombre_usuario'] ."</td>";
     echo "</tr>";
     
    }
    echo "</table>";

}else{
    
    
    echo"<h1>SIN NINGUN REGISTRO</h1>";
    }

    echo "<br><br><br><h1><a href='index.html'>VOVLER A MENÚ PRINCIPAL</a></h1><br><br><br>";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros</title>
    <link rel="stylesheet" href="recursos/css/estilo_visualizacion_registros.css">
    <link rel="shortcut icon" href="recursos/img/logofavicon.jpg" type="image/x-icon">
</head>
<body>
    
</body>
</html>