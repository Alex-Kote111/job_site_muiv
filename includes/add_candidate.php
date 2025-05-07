<?php
require 'connect.php';

session_start();

$error = true;
$secret = '6LcnkDErAAAAAEN0lLAcs5NmO4OcK5LKOfJhgln5';

if (!empty($_POST['g-recaptcha-response'])) {
    $out = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret=' . $secret . '&response=' . $_POST['g-recaptcha-response']);
    $out = json_decode($out);
    if ($out->success == true) {
        $error = false;
    }
}

$_SESSION["error"] = $error;
// если капча не пройдена, то возвращаемся на главную и не добавляем в БД
if ($error) {
    header('Location: ../public/index.php');
    die();
}
/* header('Location: ../public/index.php'); */
// unset($_SESSION["vacancy_number"]); // удалим номер вакансии после успешного добавления в БД
print_r($_POST);
echo "<br>";
print_r($_FILES["photo"]);
