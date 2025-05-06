<?php
require "connect.php";

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, true);

$query = "SELECT vacancy_number FROM vacancies WHERE vacancy_number = $1";
$result = pg_query_params($conn, $query, array($input['vacancy_number']));
if (pg_num_rows($result) !== 0) {
    header('Result: duplicate vacancy');
    http_response_code(400); // уже есть вакансия с таким номером
    die();
}

$result = pg_insert($conn, 'vacancies', $input);
if (!$result) {
    header('Result: incorrect data');
    http_response_code(400); // некорректные данные
    die();
}
