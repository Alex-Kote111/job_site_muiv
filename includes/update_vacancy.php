<?php
require "connect.php";

$inputJSON = file_get_contents('php://input');
$input = json_decode($inputJSON, true);

$query = "SELECT vacancy_number FROM vacancies WHERE vacancy_number = $1";
$result = pg_query_params($conn, $query, array($input['vacancy_number']));
if (pg_num_rows($result) === 0) {
    header('Result: no vacancy found');
    http_response_code(400); // вакансия с таким номером не найдена
    die();
}
$condition = $array = array('vacancy_number' => $input['vacancy_number']);
$result = pg_update($conn, 'vacancies', $input, $condition);
if (!$result) {
    header('Result: incorrect data');
    http_response_code(400); // некорректные данные
    die();
}
