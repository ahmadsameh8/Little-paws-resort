<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP</title>
</head>
<body>


<?php
$checkin = $_GET["checkin"];
$checkout = $_GET["checkout"];
$roomspets = $_GET["roomspets"];



?>
<table border="2" cellspacing="0" cellpadding="8">
<tr><th>Checkin</th><th>Check Out</th><th>rooms/pets</th></tr>
<tr><td><?php echo"$checkin"; ?></td><td><?php echo"$checkout"; ?></td><td><?php echo"$roomspets"; ?></td></tr>
</table>
</body>
</html>
