<?php

try{
    $pdo = new PDO("mysql:dbname=radix; host=localhost","root","");
}catch(PDOException $e){
    echo "Error".$e->getMessage();
}