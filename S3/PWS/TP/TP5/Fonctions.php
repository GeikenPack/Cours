<?php
    function afficheTabHtml($tab, $tmp)
    {
        echo "<table border =\'2\'>";
        echo "<TR>";
        foreach($tab[0] as $cat => $elm)
        {
            echo '<TD>'.$cat.'</TD>';
        }
        echo '</TR>';
        foreach($tmp as $cat)
        {
            echo '<TR>';
            foreach($cat as $elm)
            {
                echo '<TD>'.$elm.'</TD>';
            }
            echo '</TR>';
        }
        echo "</table>";
    }
?>