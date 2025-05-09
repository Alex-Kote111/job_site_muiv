<?php
require "connect.php";

if (!array_key_exists('code', $_GET) || !array_key_exists('state', $_GET)) {
    http_response_code(404);
    die();
}

$authorization_code = $_GET['code'];
$state = $_GET['state'];
$key_state = substr($state, 0, 12);
$len_state = strlen($state);
$username = substr($state, 12);

if (strlen($state) < 13 || substr($state, 0, 12) !== "podbor_muiv_") {
    http_response_code(404);
    die();
}

$query = "SELECT id FROM user_authorization_codes WHERE username = $1";
$result = pg_query_params($conn, $query, array($username));
if (!$result) {
    die("Ошибка запроса: " . pg_last_error());
}

$number_lines = pg_num_rows($result);
if ($number_lines === 0) {
    // добавить пользователя с кодом авторизации
    $query = "INSERT INTO user_authorization_codes (username, authorization_code) VALUES ($1, $2)";
    $result = pg_query_params($conn, $query, array($username, $authorization_code));
    if (!$result) {
        die("Ошибка запроса: " . pg_last_error());
    }
    echo "Добавлен новый пользователь с кодом авторизации";
} elseif ($number_lines === 1) {
    // обновить код авторизации найденному пользователю
    $query = "UPDATE user_authorization_codes SET authorization_code = $1 WHERE username = $2";
    $result = pg_query_params($conn, $query, array($authorization_code, $username));
    if (!$result) {
        die("Ошибка запроса: " . pg_last_error());
    }
    echo "Обновлен код авторизации у пользователя";
}

header('Location: https://hh.ru/');
