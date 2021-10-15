<?php
    setcookie('CmorgadoJonathan', "", time()-3600);
    header('Location: '.$_GET['lien']);
?>