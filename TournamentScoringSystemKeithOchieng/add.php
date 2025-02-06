<?php
// Include the database connection file
include('db_connection.php');

// Variables to hold the limits
$max_teams = 4;
$max_team_members = 5;
$max_individuals = 20;
$message = "";

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST['add_team'])) {
        // Handle adding a team
        $team_count_query = "SELECT COUNT(*) as team_count FROM teams";
        $result = $conn->query($team_count_query);
        $row = $result->fetch_assoc();
        $team_count = $row['team_count'];

        if ($team_count >= $max_teams) {
            $message = "Team limit reached! No more teams can be entered.";
        } else {
            $team_name = trim($_POST['team_name']);
            $members = trim($_POST['members']);
            $member_count = count(explode(',', $members));

            if (empty($team_name) || empty($members)) {
                $message = "Team name and members cannot be empty.";
            } elseif ($member_count != $max_team_members) {
                $message = "Each team must have exactly $max_team_members members.";
            } else {
                // Insert the team into the database
                $sql = "INSERT INTO teams (team_name, members) VALUES (?, ?)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param('ss', $team_name, $members);

                if ($stmt->execute()) {
                    $message = "Team '$team_name' added successfully!";
                } else {
                    $message = "Error adding team: " . $conn->error;
                }
            }
        }
    } elseif (isset($_POST['add_individual'])) {
        // Handle adding an individual
        $individual_count_query = "SELECT COUNT(*) as individual_count FROM participants WHERE type = 'individual'";
        $result = $conn->query($individual_count_query);
        $row = $result->fetch_assoc();
        $individual_count = $row['individual_count'];

        if ($individual_count >= $max_individuals) {
            $message = "Individual participant limit reached! No more individuals can be entered.";
        } else {
            $name = trim($_POST['name']);

            if (empty($name)) {
                $message = "Participant name cannot be empty.";
            } else {
                // Insert individual into the database
                $sql = "INSERT INTO participants (name, type, points) VALUES (?, 'individual', 0)";
                $stmt = $conn->prepare($sql);
                $stmt->bind_param('s', $name);

                if ($stmt->execute()) {
                    $message = "Individual participant '$name' added successfully!";
                } else {
                    $message = "Error adding participant: " . $conn->error;
                }
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Participant</title>
    <link rel="stylesheet" href="style/add_participant.css">
</head>
<body>
    <div class="container">
        <!-- Sidebar Navigation -->
        <div class="sidebar">
            <h2>Menu</h2>
            <ul>
                <li><a href="index.php">Home</a></li>
                <li><a href="participants.php">Participants</a></li>
                <li><a href="matchups.php">Matchups</a></li>
                <li><a href="pending_matchups.php">Pending</a></li>
                <li><a href="completed_matchups.php">Completed</a></li>
                <li><a href="rules.php">Rules</a></li>
                <li><a href="standings.php">Standings</a></li>
                <li><a href="add_participant.php">Add Participants</a></li>
                <li><a href="manage_events.php">Events</a></li>
            </ul>
        </div>

        <!-- Main Content Area -->
        <div class="content">
            <h1>Add Participant</h1>
            <?php if (!empty($message)): ?>
                <p class="message"><?php echo $message; ?></p>
            <?php endif; ?>

            <!-- Individual Form -->
            <form method="POST" action="">
                <h2>Add Individual Participant</h2>
                <label for="name">Participant Name:</label>
                <input type="text" name="name" required><br>
                <input type="submit" name="add_individual" value="Add Individual">
            </form>

            <!-- Team Form -->
            <form method="POST" action="">
                <h2>Add Team</h2>
                <label for="team_name">Team Name:</label>
                <input type="text" name="team_name" required><br>

                <label for="members">Team Members (comma separated):</label>
                <input type="text" name="members" required><br>

                <input type="submit" name="add_team" value="Add Team">
            </form>
        </div>
    </div>
</body>
</html>
