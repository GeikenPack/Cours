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
                        $sexe = "H";
                        $age = 19;
                        $poids = 80;
                        $genre = ($sexe == "F") ? "Mme" : "Mr";
                        $catAge = ($age < 21) ? "junior" : "senior";
            
                        switch (true)
                        {
                            case $poids < 60:
                                $catPoids = "Super-léger";
                                break;
                            case $poids < 73:
                                $catPoids = "Légers";
                                break;
                            case $poids < 90:
                                $catPoids = "\"super\" moyens";
                                break;
                            case $poids < 100:
                                $catPoids = "mi-lourds";
                                break;
                            case $poids >= 100:
                                $catPoids = "lourds";
                                break;
                        }
                        echo "$genre est un $catAge dans la catégorie $catPoids";
                    ?>

                </div>
            </div>
        </div>

        <?php include("./include/footer.php"); ?>
    </body>
</html>
