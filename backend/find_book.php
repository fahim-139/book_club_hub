<?php


session_start();                             
$isLoggedIn = isset($_SESSION['user_id']);   

?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Find Book</title>
  <style>
    body{
      font-family:'Playfair Display',serif;
      background:#fdf9f6;
      color:#333;
      text-align:center;
      padding:50px;
    }
    .book-result{
      border:1px solid #ccc;
      padding:20px;
      margin:auto;
      max-width:600px;
      border-radius:10px;
      background:#fff;
      box-shadow:0 4px 12px rgba(0,0,0,.1);
    }
    .book-result img{
      width:200px;height:auto;margin-bottom:15px;
    }
    .book-title{font-size:1.5em;color:#cc3366;}
    .back-button{
      display:inline-block;margin-top:30px;padding:10px 20px;
      background:#cc3366;color:#fff;text-decoration:none;border-radius:5px;
    }
    .back-button:hover{background:#aa1144;}
  </style>
</head>
<body>

<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $title = $_POST['title'] ?? '';

    // 3. connect to XAMPP MySQL
    $conn = new mysqli('localhost', 'root', '', 'bookclubhubdb');
    if ($conn->connect_error) {
        echo "<p>Database connection failed: " . $conn->connect_error . "</p>";
        exit;
    }

    // 4. find the book
    $stmt = $conn->prepare('SELECT * FROM books WHERE title = ?');
    $stmt->bind_param('s', $title);
    $stmt->execute();
    $result = $stmt->get_result();

    echo "<div class='book-result'>";
    if ($result->num_rows > 0) {
        $book = $result->fetch_assoc();
        echo "<img src='" . htmlspecialchars($book['cover']) . "' alt='Book Cover'>";
        echo "<h2 class='book-title'>" . htmlspecialchars($book['title']) . "</h2>";
        echo "<p><strong>Author:</strong> " . htmlspecialchars($book['author']) . "</p>";
        echo "<p><strong>Description:</strong><br>" . htmlspecialchars($book['description']) . "</p>";
    } else {
        echo "<p>No book found with the title '<strong>" .
             htmlspecialchars($title) . "</strong>'.</p>";
    }

    // 5. back button changes with login state
    if ($isLoggedIn) {
        echo "<a class='back-button' href='index.php'>Back to Home Page</a>";
    } else {
        echo "<a class='back-button' href='../frontend/index.html'>Back to Home Page</a>";
    }
    echo "</div>";

    $stmt->close();
    $conn->close();
} else {
    // optional: redirect if page accessed directly
    header('Location: ../frontend/index.html');
    exit;
}
?>

</body>
</html>