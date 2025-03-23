<?php
$servername = "mysql"; // Use the Docker service name
$username = "root"; // Replace with your MySQL user
$password = ""; // Replace with your MySQL password
$db = "eventsite"; // Replace with your database name

// Create connection
$con = mysqli_connect($servername, $username, $password, $db);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
?>

<!-- <?php

$servername = "129.151.253.241";
$username = "root";
$password = "your_password";
$db = "eventsite";

// Create connection
$con = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}


?> -->
