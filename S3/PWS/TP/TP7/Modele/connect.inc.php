<?php
    $host = "localhost";
    $name = 'myPws2038';
    $user = "root";
    $pass = "admin";
    $dsn = 'mysql:host='.$host.';dbname='.$name.';charset=utf8';

    try
    {
        $conn = new PDO($dsn, $user, $pass);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $e) {echo $e->getMessage();}
?>