<?php
include 'model_dokter.php';

$isiTabelDokter = getTabelDokter();

include 'view_dokter.php';

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['action']) && $_GET['action'] === 'view') {
        // Fetch and display all doctors
        $doctors = fetchAllDoctors(); // Define this function to get data from the database
        include 'dokter_view.php'; // Include the view for displaying doctors
    } elseif (isset($_GET['action']) && $_GET['action'] === 'add') {
        // Logic for adding a doctor
        include 'tambahdokter.php'; // Include the form to add a new doctor
    } elseif (isset($_GET['action']) && $_GET['action'] === 'edit' && isset($_GET['id'])) {
        // Logic for editing a doctor
        $doctor = fetchDoctorById($_GET['id']); // Define this function to get a single doctor's data
        include 'editdokter.php'; // Include the edit form
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['submit'])) {
        // Logic to handle form submission for adding/editing a doctor
        handleDoctorFormSubmission($_POST); // Define this function for handling form submission
    }
}
?>