<?php
require 'connect.php';

if (!array_key_exists('vacancy_number', $_GET) || !array_key_exists('HTTP_APPLICATION', $_SERVER)) {
    http_response_code(404);
    die();
}

if ($_SERVER['HTTP_APPLICATION'] !== "1C_recruitment") {
    http_response_code(404);
    die();
}

$vacancy_number = $_GET['vacancy_number'];

$query = "SELECT id, name, city, metro, education, sex, date_birth, email, phone, photo_extension, resume_extension  FROM responses_vacancies WHERE vacancy_number = $1";
$result = pg_query_params($conn, $query, array($vacancy_number));
if (!$result) {
    die("Ошибка запроса: " . pg_last_error());
}

$data = pg_fetch_all($result);
if ($data === false) {
    $data = []; // Возвращаем пустой массив, если данных нет
}

header('Content-Type: application/json');
echo json_encode($data);
