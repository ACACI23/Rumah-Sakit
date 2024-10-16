<?php
function koneksi() {
    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $dbname = "rumah_sakit";
    
    return mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);
}

function getTabelKunjungan() {
    $link = koneksi();
    $query = "SELECT * FROM kunjungan";
    $result = mysqli_query($link, $query);
    
    // Fetch all results as an associative array
    $hasil = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    return $hasil;
}
?>
