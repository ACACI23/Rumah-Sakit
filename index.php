<?php
header('Location: controller_pasien.php');

if ($someCondition) {
    header('Location: controller_dokter.php'); // Redirect to dokter controller if needed
    exit;
}
?>
