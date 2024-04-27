<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Iniciar sesion</title>
    <meta charset = "utf-8">
    <link rel="stylesheet" href="recursos/css/estilo_iniciar_sesion.css">
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
    <h1>INICIO DE SESIÓN</h1>
    <br><br>
    <form action="submit_iniciar_sesion.php" method="post">

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

        <input type="submit" name="iniciar_sesion" class="btn btn-primary" value="INICIAR SESIÓN">
        <input type="reset" name="clear" class="btn btn-primary" value="BORRAR REGISTROS">    
        <br><br>
    </form>

    <br><br><br>

    <p style="--i:1"class="menu_principal"><a href="index.html">Menú principal</a></p>
 </body>
</html>