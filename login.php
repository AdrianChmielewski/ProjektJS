<?php

function getUserFromDatabase($loginUsername) {
    $conn = new mysqli('localhost', 'root', '', 'baza');

    if ($conn->connect_error) {
        die('Błąd połączenia z bazą danych: ' . $conn->connect_error);
    }

    $checkUserSql = "SELECT * FROM uzytkownicy WHERE nazwa_uzytkownika = ?";
    $stmt = $conn->prepare($checkUserSql);
    $stmt->bind_param("s", $loginUsername);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        $stmt->close();
        $conn->close();
        return $user;
    } else {
        $stmt->close();
        $conn->close();
        return null;
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['loginUsername']) && isset($_POST['loginPassword'])) {
        $loginUsername = $_POST['loginUsername'];
        $loginPassword = $_POST['loginPassword'];

   
        $user = getUserFromDatabase($loginUsername);

        if ($user) {
            
            $hashedPassword = $user['haslo']; 

            if (password_verify($loginPassword, $hashedPassword)) {
              
                echo json_encode(['success' => true]);
            } else {
             
                echo json_encode(['success' => false, 'message' => 'Błędne hasło']);
            }
        } else {
           
            echo json_encode(['success' => false, 'message' => 'Użytkownik nie istnieje']);
        }
    } else {
        echo json_encode(['success' => false, 'message' => 'Nieprawidłowe dane']);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Nieprawidłowe żądanie']);
}
?>
