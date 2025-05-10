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
$query = "SELECT name_file_resume, resume_file FROM responses_vacancies WHERE id = $1";
$result = pg_query_params($conn, $query, array($user_id));

// Получаем данные
$row = pg_fetch_assoc($result);
if (!$row) {
    http_response_code(404);
    die("Пользователь не найден");
}


// Извлекаем данные
$name_file = $row['name_file_resume'];
$file_content = $row['resume_file'];

// Конвертируем bytea в бинарные данные
if (substr($file_content, 0, 2) === '\\x') {
    $file_content = hex2bin(substr($file_content, 2));
} else {
    $file_content = pg_unescape_bytea($file_content);
}

// Формируем JSON-ответ
$response = [
    'name_file' => $row['name_file_resume'],
    'resume_file' => base64_encode($file_content)
];
echo json_encode($response);
