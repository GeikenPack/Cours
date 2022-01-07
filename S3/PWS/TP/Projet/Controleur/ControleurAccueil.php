<?php
    class ControleurAccueil
    {
        public function __construct(){
        }

        public function getAccueil()
        {
            include 'Vue/VueAccueil.php';
        }
    }
?>