<?php
include('db_connection.php');

if (isset($_GET['id']) && isset($_GET['type'])) {
    $id = intval($_GET['id']);
    $type = $_GET['type'];

    if ($type == 'individual') {
        $stmt = $conn->prepare("DELETE FROM participants WHERE id = ?");
    } elseif ($type == 'team') {
        $stmt = $conn->prepare("DELETE FROM teams WHERE id = ?");
    }

    if (isset($stmt)) {
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            echo "<p>Successfully deleted.</p>";
        } else {
            echo "<p>Error deleting record: " . $conn->error . "</p>";
        }
        $stmt->close();
    }
}

$conn->close();
header("Location: participants.php"); // Redirect back to participants page after deletion
exit;
?>
