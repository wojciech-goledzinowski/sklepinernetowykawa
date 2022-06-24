<?php
// połączenie z bazą danych MySQL
// lokalnie jest to baza: projektsklep

    $adres = '127.0.0.1';
    $uzytkownik = 'root';
    $haslo = '';
    $nazwa_bazy = 'projektsklep';

    // ustanawiamy połączenie z bazą, jak się nie łączy, wyświetlamy błąd
    $db_c  = @mysqli_connect($adres, $uzytkownik, $haslo, $nazwa_bazy)
    or die('Brak polaczenia z serwerem MySQL.<br />Blad: '.mysqli_error($db_c));

    // ustawiamy kodowanie na utf8
    mysqli_query($db_c, "SET NAMES utf8");
?>