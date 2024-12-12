<?php 
 
$conn = mysqli_connect ("localhost", "root", "", "mojekino");

if(!$conn){
    die("Brak połączenia z bazą danych: ". mysqli_connect_error());
}

$tytul = $_POST['tytul'];
$rezyser = $_POST['rezyser'];

$sql = "INSERT INTO FILMY(TYTUL,REZYSER) VALUES ('$tytul','$rezyser')";

if ($conn->query($sql) === TRUE) {
    echo "Dane zostały zapisane pomyślnie!";
} else {
    echo "Błąd: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>