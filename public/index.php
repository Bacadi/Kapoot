<?php
session_start();


if ($SERVER["REQUEST_METHOD"] == "POST") {

}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post">
        <label for="username">User: </label>
        <input id="username" name="username" type="text" placeholder="Enter your username" required maxlength="50">
    </form>
</body>
</html>