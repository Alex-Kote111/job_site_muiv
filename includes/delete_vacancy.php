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
// Удаляем вакансию
$query = "DELETE FROM vacancies WHERE vacancy_number = $1";
$result = pg_query_params($conn, $query, array($vacancy_number));

if (pg_affected_rows($result) === 0) {
    http_response_code(400); // не удалось удалить вакансию
    die();
}
