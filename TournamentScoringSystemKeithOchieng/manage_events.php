<?php
// Include database connection
include('db_connection.php');

// Variables to hold messages
$message = '';
$events = [];

// Fetch existing events
$result = $conn->query("SELECT * FROM events");
if ($result->num_rows > 0) {
    $events = $result->fetch_all(MYSQLI_ASSOC);
}

// Handle adding new event
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['add_event'])) {
    $event_name = $_POST['event_name'];
    $event_type = $_POST['event_type'];

    // Append (single) or (team) to the event name based on the event type
    if ($event_type == "individual") {
        $event_name = "single_" . $event_name;
    } else if ($event_type == "team") {
        $event_name = "team_" . $event_name;
    }

    // Check for duplicates
    $duplicate_check = $conn->query("SELECT * FROM events WHERE event_name='$event_name'");
    
    if ($duplicate_check->num_rows > 0) {
        $message = "This event already exists!";
    } else {
        // Count existing events for the specified type
        $event_count_check = $conn->query("SELECT COUNT(*) as event_count FROM events WHERE event_type='$event_type'");
        $event_count = $event_count_check->fetch_assoc()['event_count'];

        if ($event_count >= 5) {
            $message = "You cannot create more than 5 $event_type events.";
        } else {
            // Insert event into database
            $sql = "INSERT INTO events (event_name, event_type) VALUES ('$event_name', '$event_type')";
            if ($conn->query($sql) === TRUE) {
                $message = "Event added successfully!";
            } else {
                $message = "Error: " . $conn->error;
            }
        }
    }
}

// Handle deleting an event
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $conn->query("DELETE FROM events WHERE id=$id");
    header("Location: manage_events.php");
    exit();
}

// Handle editing an event
if (isset($_POST['edit_event'])) {
    $id = $_POST['event_id'];
    $event_name = $_POST['event_name'];
    $event_type = $_POST['event_type'];

    // Update event
    $sql = "UPDATE events SET event_name='$event_name', event_type='$event_type' WHERE id=$id";
    if ($conn->query($sql) === TRUE) {
        $message = "Event updated successfully!";
    } else {
        $message = "Error: " . $conn->error;
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Events</title>
    <link rel="stylesheet" href="style/styles_matchups.css">
</head>
<body>
    <div class="sidebar">
        <ul>
            <li><a href="index.php">Home</a></li>
            <li><a href="participants.php">Participants</a></li>
            <li><a href="test.php">Result</a></li>
            <li><a href="rules.php">Rules</a></li>
            <li><a href="standings.php">Standings</a></li>
            <li><a href="add_participant.php">Add Participants</a></li>
            <li><a href="manage_events.php">Events</a></li>
        </ul> 
    </div>

    <div class="content">
        <h1>Manage Events</h1>
        <?php if ($message) echo "<p class='message'>$message</p>"; ?>

        <h2>Add New Event</h2>
        <form method="POST" action="">
            <label for="event_name">Event Name:</label>
            <input type="text" name="event_name" required><br>
            <label for="event_type">Event Type:</label>
            <select name="event_type" required>
                <option value="individual">Individual</option>
                <option value="team">Team</option>
            </select><br>
            <input type="submit" name="add_event" value="Add Event">
        </form>

        <h2>Existing Events</h2>
        <table>
            <tr>
                <th>Event Name</th>
                <th>Event Type</th>
                <th>Actions</th>
            </tr>
            <?php foreach ($events as $event): ?>
                <tr>
                    <td><?php echo htmlspecialchars($event['event_name']); ?></td>
                    <td><?php echo htmlspecialchars($event['event_type']); ?></td>
                    <td>
                        <form method="POST" action="manage_events.php">
                            <input type="hidden" name="event_id" value="<?php echo $event['id']; ?>">
                            <input type="text" name="event_name" value="<?php echo htmlspecialchars($event['event_name']); ?>" required>
                            <select name="event_type" required>
                                <option value="individual" <?php echo $event['event_type'] == 'individual' ? 'selected' : ''; ?>>Individual</option>
                                <option value="team" <?php echo $event['event_type'] == 'team' ? 'selected' : ''; ?>>Team</option>
                            </select>
                            <input type="submit" name="edit_event" value="Edit">
                        </form>
                        <a href="?delete=<?php echo $event['id']; ?>" onclick="return confirm('Are you sure you want to delete this event?');">Delete</a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>
</body>
</html>
