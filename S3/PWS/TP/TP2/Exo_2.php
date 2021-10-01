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
                <?php
                    function division($n1, $n2)
                    {
                        if ($n2 == 0)
                        {
                            throw new Exception("Division par 0");
                        }
                        return $n1/$n2;
                    }

                    try
                    {
                        echo 'Division de 2 par 2 : '.division(2,2).'<BR>';
                        echo 'Division de 2 par 0 : '.division(2,0).'<BR>';
                    }
                    catch (Exception $e) {echo $e->getMessage();}

                    error_reporting(E_ALL);
                    fopen('rien.t', 'r');
                ?>
            </div>
        </div>
    </div>

	<?php include("./include/footer.php"); ?>
</body>
</html>
