<html>
    <head>
        <meta charset="utf-8"/>
    </head>

    <body>
        <?php
            if (isset($_GET['msgError']))
            {
                echo '<h1>'.$_GET['msgError'].'</h1>';
            }
        ?>
        <h1>Veuillez entrer les identifiants pour accéder aux données</h1>
        <form method="POST" action="TraitConnexion.php">
            <?php
            echo 'Login : <input type="text" name="login" ';
            if (isset($_COOKIE['CmorgadoJonathan']))
            {
                echo 'value="'.$_COOKIE['CmorgadoJonathan'].'"';   
            }
            echo '/> <br><br>';
            ?>
            Mot de passe : <input type="password" name="password"><br><br>
            <input type="checkbox" name="cb"> Se souvenir de moi <br><br>
            <input type="submit" name="afficher" value="Valider">
        </form>
    </body>
</html>