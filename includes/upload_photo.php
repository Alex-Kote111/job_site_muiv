<?php
require 'connect.php';

if (!array_key_exists('id', $_GET) || !array_key_exists('HTTP_APPLICATION', $_SERVER)) {
    http_response_code(404);
    die();
}

if ($_SERVER['HTTP_APPLICATION'] !== "1C_recruitment") {
    http_response_code(404);
    die();
}

$user_id = $_GET['id'];
$query = "SELECT name_file_photo, photo FROM responses_vacancies WHERE id = $1";
$result = pg_query_params($conn, $query, array($user_id));

// Получаем данные
$row = pg_fetch_assoc($result);
if (!$row) {
    http_response_code(404);
    die("Пользователь не найден");
}


// Извлекаем данные
$name_photo = $row['name_file_photo'];
$photo = $row['photo'];

// Конвертируем bytea в бинарные данные
if (substr($photo, 0, 2) === '\\x') {
    $photo = hex2bin(substr($photo, 2));
} else {
    $photo = pg_unescape_bytea($photo);
}

// Формируем JSON-ответ
$response = [
    'name_photo' => $row['name_file_photo'],
    'photo' => base64_encode($photo)
];
echo json_encode($response);
