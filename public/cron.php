<?php
$servername = "localhost";
$username = "sam_upsc";
$password = "sammy@123";
$dbname = "sam_upsc";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$datetime = date('Y-m-d');
$sql = "UPDATE app_users SET logged=0, verified=0 WHERE DATE(updated_at) != '$datetime'";

if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
    echo("date is $datetime");
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();
?>