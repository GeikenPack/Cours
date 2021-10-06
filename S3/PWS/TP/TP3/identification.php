<html>
    <head>
        <meta charset="utf-8"/>
    </head>

    <body>
        <h1>Veuillez entrer les identifiants pour accéder aux données</h1>
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF'] ?>">
            Login : <input type="text" name="login" value="Achille"/> <br><br>
            Mot de passe : <input type="password" name="password" value="Talon"><br><br>
            <input type="submit" name="afficher" value="Valider">
        </form>

        <?php 
            if(isset($_POST['afficher']))
            {
                if (htmlentities($_POST['login']) != "Achille" || htmlentities($_POST['password']) != 'Talon')
                {
                    echo '<h1>Identifiants incorrect</h1>';
                }
                else
                {
                    echo '<script>window.location="index.php"</script>';
                }
            }
        ?>
    </body>
</html>