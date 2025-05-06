<?php
require 'connect.php';

$query = "SELECT vacancy_title, type_of_employment, experience, salary_from, salary_up_to, before_tax FROM vacancies";
$result = pg_query($conn, $query);
if (!$result) {
    die("Ошибка запроса: " . pg_last_error());
}


/* while ($row = pg_fetch_assoc($result)) {

    echo $row['vacancy_title'] . " " . $row['education'] . " " . $row['experience'] . "<br>";
} */
