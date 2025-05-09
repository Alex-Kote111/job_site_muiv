<?php
require "connect.php";

$username  = $_GET["username"];

$query = "SELECT authorization_code FROM user_authorization_codes WHERE username = $1";
$result = pg_query_params($conn, $query, array($username));

if (!$result) {
    die("Ошибка запроса: " . pg_last_error());
}

$result = pg_fetch_all($result) ?: [];
$json = json_encode($result);

echo $json;
