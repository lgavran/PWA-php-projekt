<?php

$servername = "localhost";
$username = "root";
$password = "";
$database = "projekt";
$port = 3307;

$conn = mysqli_connect(
    $servername,
    $username,
    $password,
    $database,
    $port
);

if (!$conn) {
    die("Greška spajanja: " . mysqli_connect_error());
}

mysqli_set_charset($conn, "utf8mb4");

?>