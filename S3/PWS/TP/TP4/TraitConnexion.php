<?php
    session_start();
    if (isset($_POST['afficher']))
    {
        if (htmlentities($_POST['login']) != "Achille" || htmlentities($_POST['password']) != "Talon")
        {
            header('Location: FormConnexion.php?msgError=Erreur de connexion, mauvais identifiants');
        }
        else
        {
            $_SESSION['SmorgadoJonathan'] = $_POST['login'];
            if (isset($_POST['cb']))
            {
                setcookie('CmorgadoJonathan', time()+5*60);
            }
            header("Location: index.php");
        }
    }
?>