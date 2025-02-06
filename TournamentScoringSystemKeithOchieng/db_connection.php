<?php
// Database connection settings
$servername = "localhost";
$username = "root"; // default username for MAMP/XAMPP is 'root'
$password = ""; // default password for MAMP/XAMPP is usually empty
$dbname = "t1"; // the name of the database you created

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
