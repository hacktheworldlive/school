<?php
include('db_connection.php');

// Error handling for connection
if ($conn->connect_error) {
    die("Database connection failed: " . $conn->connect_error);
}

// Function to get participant type
function getParticipantType($participant_name) {
    global $conn;
    
    // Check if the participant is in teams
    $team_query = $conn->query("SELECT * FROM teams WHERE team_name = '$participant_name'");
    if ($team_query->num_rows > 0) {
        return 'team';
    }
    
    // Check if the participant is an individual
    $individual_query = $conn->query("SELECT * FROM participants WHERE name = '$participant_name' AND type='individual'");
    if ($individual_query->num_rows > 0) {
        return 'individual';
    }
    
    return 'unknown';
}

// Fetch all events
$events_query = $conn->query("SELECT DISTINCT event FROM scores ORDER BY event");
$events = $events_query->fetch_all(MYSQLI_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tournament Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            width: 90%;
            margin: auto;
            overflow: hidden;
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        h1, h2 {
            color: #333;
        }
        .team-results, .individual-results {
            margin-bottom: 30px;
        }
    </style>
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
    <div class="container">
        <h1>Tournament Results</h1>

        <?php foreach ($events as $event_data): 
            $event = $event_data['event'];
            
            // Separate team and individual results
            $team_results_query = $conn->query("
                SELECT participant_name, 
                       SUM(points) as total_points, 
                       COUNT(*) as participation_count
                FROM scores 
                WHERE event = '$event' 
                AND participant_name IN (SELECT team_name FROM teams)
                GROUP BY participant_name 
                ORDER BY total_points DESC, participation_count DESC
            ");

            $individual_results_query = $conn->query("
                SELECT participant_name, 
                       SUM(points) as total_points, 
                       COUNT(*) as participation_count
                FROM scores 
                WHERE event = '$event' 
                AND participant_name IN (SELECT name FROM participants WHERE type='individual')
                GROUP BY participant_name 
                ORDER BY total_points DESC, participation_count DESC
            ");
        ?>
            <h2><?php echo htmlspecialchars($event); ?> Results</h2>
            
            <?php if ($team_results_query->num_rows > 0): ?>
                <div class="team-results">
                    <h3>Team Results</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Rank</th>
                                <th>Team</th>
                                <th>Total Points</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $rank = 1;
                            while ($row = $team_results_query->fetch_assoc()): 
                            ?>
                                <tr>
                                    <td><?php echo $rank++; ?></td>
                                    <td><?php echo htmlspecialchars($row['participant_name']); ?></td>
                                    <td><?php echo htmlspecialchars($row['total_points']); ?></td>
                                </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>

            <?php if ($individual_results_query->num_rows > 0): ?>
                <div class="individual-results">
                    <h3>Individual Results</h3>
                    <table>
                        <thead>
                            <tr>
                                <th>Rank</th>
                                <th>Participant</th>
                                <th>Total Points</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                            $rank = 1;
                            while ($row = $individual_results_query->fetch_assoc()): 
                            ?>
                                <tr>
                                    <td><?php echo $rank++; ?></td>
                                    <td><?php echo htmlspecialchars($row['participant_name']); ?></td>
                                    <td><?php echo htmlspecialchars($row['total_points']); ?></td>
                                </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        <?php endforeach; ?>
    </div>
</body>
</html>