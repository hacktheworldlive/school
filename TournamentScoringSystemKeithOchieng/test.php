<?php
include('db_connection.php');

// Error handling for connection issues
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

// Fetch teams and individual participants
$teams_result = $conn->query("SELECT * FROM teams");
$individuals_result = $conn->query("SELECT * FROM participants");

// Fetch events with submission status
$events_result = $conn->query("SELECT * FROM events");
$team_events = [];
$individual_events = [];

// Separate events into team and individual categories
while ($event = $events_result->fetch_assoc()) {
    if ($event['event_type'] == 'team') {
        $team_events[] = $event;
    } else {
        $individual_events[] = $event;
    }
}

// Handle points submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $event = $_POST['event'];
    $positions = $_POST['positions'];

    // Points distribution: 1st=5, 2nd=3, 3rd=1, others=0
    $points = [5, 3, 1];

    // Check if the event is a team event
    if ($event && in_array($event, array_column($team_events, 'event_name'))) {
        foreach ($positions as $rank => $team_id) {
            $point_value = $points[$rank] ?? 0;
            $team_name = $conn->query("SELECT team_name FROM teams WHERE id = $team_id")->fetch_assoc()['team_name'];

            // Insert or update points
            $conn->query("INSERT INTO scores (event, participant_name, points) 
                          VALUES ('$event', '$team_name', $point_value) 
                          ON DUPLICATE KEY UPDATE points = points + $point_value");
        }
    } else {
        foreach ($positions as $rank => $participant_id) {
            $point_value = $points[$rank] ?? 0;
            $participant_name = $conn->query("SELECT name FROM participants WHERE id = $participant_id")->fetch_assoc()['name'];

            // Insert or update points
            $conn->query("INSERT INTO scores (event, participant_name, points) 
                          VALUES ('$event', '$participant_name', $point_value) 
                          ON DUPLICATE KEY UPDATE points = points + $point_value");
        }
    }

    // Mark the event as submitted
    $conn->query("UPDATE events SET submitted = TRUE WHERE event_name = '$event'");
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tournament Results</title>
    <link rel="stylesheet" href="style/styles_matchups.css">
    <style>
        .submitted {
            background-color: green;
            color: white;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <!-- Sidebar menu -->
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
        <h1>Submit Results</h1>

        <!-- Team Events -->
        <h2>Team Events</h2>
        <?php if (count($team_events) > 0): ?>
            <?php foreach ($team_events as $event): ?>
                <form method="POST" action="">
                    <h3><?php echo htmlspecialchars($event['event_name']); ?></h3>
                    <input type="hidden" name="event" value="<?php echo htmlspecialchars($event['event_name']); ?>">
                    <label for="positions">Select Positions:</label>
                    <ol>
                        <?php
                        $teams = $conn->query("SELECT id, team_name FROM teams");
                        $team_list = $teams->fetch_all(MYSQLI_ASSOC);
                        for ($i = 0; $i < 3; $i++): ?>
                            <li>
                                <select name="positions[<?php echo $i; ?>]" required>
                                    <option value="">Select a Team</option>
                                    <?php foreach ($team_list as $team): ?>
                                        <option value="<?php echo $team['id']; ?>">
                                            <?php echo htmlspecialchars($team['team_name']); ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </li>
                        <?php endfor; ?>
                    </ol>
                    <button type="submit" class="<?php echo $event['submitted'] ? 'submitted' : ''; ?>">
                        Submit Results
                    </button>
                </form>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No team events available.</p>
        <?php endif; ?>

        <!-- Individual Events -->
        <h2>Individual Events</h2>
        <?php if (count($individual_events) > 0): ?>
            <?php foreach ($individual_events as $event): ?>
                <form method="POST" action="">
                    <h3><?php echo htmlspecialchars($event['event_name']); ?></h3>
                    <input type="hidden" name="event" value="<?php echo htmlspecialchars($event['event_name']); ?>">
                    <label for="positions">Select Positions:</label>
                    <ol>
                        <?php
                        $individuals = $conn->query("SELECT id, name FROM participants");
                        $individual_list = $individuals->fetch_all(MYSQLI_ASSOC);
                        for ($i = 0; $i < 3; $i++): ?>
                            <li>
                                <select name="positions[<?php echo $i; ?>]" required>
                                    <option value="">Select a Participant</option>
                                    <?php foreach ($individual_list as $individual): ?>
                                        <option value="<?php echo $individual['id']; ?>">
                                            <?php echo htmlspecialchars($individual['name']); ?>
                                        </option>
                                    <?php endforeach; ?>
                                </select>
                            </li>
                        <?php endfor; ?>
                    </ol>
                    <button type="submit" class="<?php echo $event['submitted'] ? 'submitted' : ''; ?>">
                        Submit Results
                    </button>
                </form>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No individual events available.</p>
        <?php endif; ?>
    </div>
</body>
</html>

