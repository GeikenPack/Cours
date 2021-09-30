<?php
    function multiplie($taille = 5)
    {
        for($i = 0; $i < $taille+1; $i++)
        {
            for ($j = 0; $j < $taille+1; $j++)
            {
                $tab[$i][$j] = 0;
                if ($i == 0 && $j == 0) {$tab[$i][$j] = "X";}
                else if ($i == 0) {$tab[$i][$j] = $j;}
                else if ($j == 0) {$tab[$i][$j] = $i;}
                else
                {
                    $tab[$i][$j] = $tab[0][$j] * $tab[$i][0];
                }
            }
        }
        echo "<h2> Tableau de multiplication </h2>";
        echo "<table border =\'2\'>";

        for ($i = 0; $i < $taille+1; $i++)
        {
            echo "<TR>";
            for ($j = 0; $j < $taille+1; $j++)
            {
                $temp = $tab[$i][$j];
                if ($j == 0 || $i == 0)
                {
                    echo "<TH>$temp</TH>";
                }
                else
                {
                    echo "<TD>$temp</TD>";
                }
            }
            echo "</TR>";
        }

        echo "</table";
    }
?>
