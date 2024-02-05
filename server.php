<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");

error_reporting(E_ALL);
ini_set('display_errors', '1');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    
    $conn = new mysqli('localhost', 'root', '', 'baza');

    if ($conn->connect_error) {
        die('Błąd połączenia z bazą danych: ' . $conn->connect_error);
    }

    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    $sql = "INSERT INTO uzytkownicy (nazwa_uzytkownika, haslo) VALUES ('$username', '$hashedPassword')";

    if ($conn->query($sql) === TRUE) {
     
        echo json_encode(['success' => true]);
    } else {
        
        echo json_encode(['success' => false, 'message' => 'Błąd podczas zapisywania do bazy danych: ' . $conn->error]);
    }

    $conn->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Nieprawidłowe żądanie.']);
}
?>
