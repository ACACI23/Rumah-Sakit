<?php
include 'model_kunjungan.php';

$isiTabelKunjungan = getTabelKunjungan();

include 'view_kunjungan.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['action']) && $_GET['action'] === 'view') {
        // Fetch and display all visits
        $visits = fetchAllVisits(); // Define this function to get data from the database
        include 'kunjungan_view.php'; // Include the view for displaying visits
    } elseif (isset($_GET['action']) && $_GET['action'] === 'add') {
        // Logic for adding a visit
        include 'tambahkunjungan.php'; // Include the form to add a new visit
    } elseif (isset($_GET['action']) && $_GET['action'] === 'edit' && isset($_GET['id'])) {
        // Logic for editing a visit
        $visit = fetchVisitById($_GET['id']); // Define this function to get a single visit's data
        include 'editkunjungan.php'; // Include the edit form
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['submit'])) {
        // Logic to handle form submission for adding/editing a visit
        handleVisitFormSubmission($_POST); // Define this function for handling form submission
    }
}
?>