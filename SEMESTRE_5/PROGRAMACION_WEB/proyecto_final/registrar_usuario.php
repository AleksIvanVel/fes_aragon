<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registrar Usuario</title>
    <meta charset = "utf-8">
    <link rel="stylesheet" href="recursos/css/estilo_registro_usuario.css">
    <link rel="shortcut icon" href="recursos/img/logofavicon.jpg" type="image/x-icon">
</head>

<script>
    function valida(e){
        tecla = (document.all) ? e.keyCode : e.which;
        //Tecla de retroceso para borrar, siempre la permite
        if (tecla==8){
            return true;
        }

        //patron de entrada, en este caso solo acepta numero
        patron =/[0-9]/;
        tecla_final = String.fromCharCode(tecla);
        return patron.test(tecla_final);
    }
</script>

<body>
    <br><br>
    <h1>REGISTRO DE USUARIO</h1>
    <br><br>
    <form action="submit_registro.php" method="post">

        <!--Nombre-->
        <div class="form-group">
            <label for="nombre">Nombre Completo:</label><br>
            <input type="text" name="usuario" maxlength="255"  required>
            <br/><br/>
        </div>

        <!-- Direcion -->
        <div class="form-group">
            <label for="direcion">Dirección:</label><br>
            <input type="text" name="direccion" maxlength="255" required>
             <br/><br/>
        </div>

        <!-- Telefono -->
        <div class="form-group">
            <label for="telefono">Telefono:</label><br>
            <input type="text" onkeypress="return valida(event)" name="telefono" maxlength="15" required>
            <br/><br/>
        </div>

        <!-- correo -->
        <div class="form-group">
            <label for="correo">Email:</label><br>
            <input type="email" name="correo" maxlength="35" required>
            <br/><br/>
        </div>

        <!--Nombre_usuario-->
        <div class="form-group">
            <label for="nombre">Nombre Usuario:</label><br>
            <input type="text" name="nombre_usuario" maxlength="255"  required>
            <br/><br/>
        </div>

        <!--Password-->
        <div class="form-group">
            <label for="pass">Password:</label><br>
            <input type="password" name="password" maxlength="8" required>
        </div>
        <br/><br/>

        <input type="submit" name="submit" class="btn btn-primary" value="REGISTRARME">
        <input type="reset" name="clear" class="btn btn-primary" value="BORRAR REGISTROS">    
        <br><br>
    </form>

    <br><br>

    <p style="--i:1"class="menu_principal"><a href="index.html">Menú principal</a></p>
 </body>
</html>