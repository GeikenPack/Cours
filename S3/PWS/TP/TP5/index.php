<?php
    session_start();
    if (isset($_SESSION['SmorgadoJonathan']))
    {
        if ($_SESSION['SmorgadoJonathan'] != 'Achille')
        {
            header('Location: FormConnexion.php?msgError=Acces Interdit');
        }
    }
    else
    {
        header('Location: FormConnexion.php?msgError=Acces Interdit');
    }
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
    <link rel="stylesheet" href="include/bootstrap.min.css">
    <link rel="stylesheet" href="include/styles.css">
	<title>Mon site PWS en PHP!</title>
</head>
<body>
	<?php include("./include/header.php"); ?>

    <?php include("./include/menus.php"); ?>
    <div style="padding-top: 30px" id="main">
        <div style="text-align: center" class="col-md-12">
                <h2>Bienvenue !</h2>

                <?php
                    require_once('connect.inc.php');
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
