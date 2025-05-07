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

// Максимальный размер файлов
$max_photo_size = 500 * 1024; // 500КБ
$max_resume_size = 1 * 1024 * 1024; // 1MB

// Валидация фото
$photo = $_FILES['photo'];
echo print_r($_FILES);

if (!empty($_FILES['photo']['name'])) {
    if ($_FILES['photo']['error'] != 0 || $photo['size'] > $max_photo_size) {
        $_SESSION["error_sending_file"] = "Фото слишком большое (макс. 500КБ)";
        header('Location: ../public/questionnaire_page.php');
        die();
    }

    if (!in_array($photo['type'], ['image/jpeg', 'image/png'])) {
        $_SESSION["error_sending_file"] = "Недопустимый тип фото";
        header('Location: ../public/questionnaire_page.php');
        die();
    }
}
// Валидация резюме
$resume = $_FILES['resume_file'];
$allowed_resume_types = [
    'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
    'application/pdf',
    'text/rtf',
    'application/rtf'
];

if (!empty($_FILES['resume_file']['name'])) {
    if ($_FILES['resume_file']['error'] != 0 || $resume['size'] > $max_resume_size) {
        $_SESSION["error_sending_file"] = "Резюме слишком большое (макс. 1MB)";
        header('Location: ../public/questionnaire_page.php');
        die();
    }

    if (!in_array($resume['type'], $allowed_resume_types)) {
        $_SESSION["error_sending_file"] = "Недопустимый тип резюме";
        print_r($_FILES);
        header('Location: ../public/questionnaire_page.php');
        die();
    }
}
// Чтение файлов
if (!empty($_FILES['photo']['name'])) { // Если файл выбран
    $photo_data = pg_escape_bytea($conn, file_get_contents($photo['tmp_name']));
} else {
    $photo_data = null;
}

if (!empty($_FILES['resume_file']['name'])) {
    $resume_data = pg_escape_bytea($conn, file_get_contents($resume['tmp_name']));
} else {
    $resume_data = null;
}
// SQL-запрос
$query = "
INSERT INTO responses_vacancies
    (name, city, metro, education, sex, date_birth, email, phone,
    photo, resume_file, vacancy_number, name_file_photo, name_file_resume,
    photo_extension, resume_extension)
VALUES
    ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15)";

$params = [
    $_POST['username'],
    $_POST['city'],
    $_POST['metro'],
    $_POST['education'],
    $_POST['sex'],
    $_POST['date_of_birth'],
    $_POST['email'],
    $_POST['phone'],
    $photo_data,
    $resume_data,
    $_SESSION["vacancy_number"],
    $photo['name'],
    $resume['name'],
    $photo['type'],
    $resume['type']
];

$result = pg_query_params($conn, $query, $params);

if (!$result) {
    die(pg_last_error($conn));
}
pg_close($conn);

unset($_SESSION["vacancy_number"]);

header('Location: ../public/index.php');
