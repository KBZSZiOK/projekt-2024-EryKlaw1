<?php
$conn = mysqli_connect ("localhost", "root", "", "mojekino");

if(!$conn){
    die("Brak połączenia z bazą danych: ". mysqli_connect_error());
}
$sql = "SELECT 
            BILETY.ID AS BILET_ID, 
            KLIENCI.IMIE AS IMIE_KLIENTA, 
            KLIENCI.NAZWISKO AS NAZWISKO_KLIENTA, 
            FILMY.TYTUL AS TYTUL_FILMU, 
            BILETY.CENA AS CENA_BILETU
        FROM 
            BILETY
        INNER JOIN 
            KLIENCI ON BILETY.KLIENT_ID = KLIENCI.ID
        INNER JOIN 
            SEANSE ON BILETY.SEANS_ID = SEANSE.ID
        INNER JOIN 
            FILMY ON SEANSE.FILM_ID = FILMY.ID
        ORDER BY 
            BILETY.CENA ASC;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'>";    
    echo "<tr>";                  
     
    while ($column = $result->fetch_field()) {
        echo "<th>" . $column->name . "</th>";
    }
        echo "</tr>";
    
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        foreach ($row as $cell) {
            echo "<td>" . $cell . "</td>";
        }
            echo "</tr>";
        }
        echo "</table>";  
    } else {
        echo "Brak wyników.";
    }

$conn->close();
?>