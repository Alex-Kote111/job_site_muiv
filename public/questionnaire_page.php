<?php

session_start();

require __DIR__ . '/../includes/connect.php';

if (empty($_SESSION["vacancy_number"])) {
    http_response_code(404);
    die();
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Анкета</title>
</head>

<body>
    <h1>Анкета</h1>

</body>

</html>
