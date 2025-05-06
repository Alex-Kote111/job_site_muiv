<?php
require __DIR__ . '/../includes/connect.php';
//require "connect.php";
$vacancy_number = $_GET["vacancy_number"];

$query = "SELECT * FROM vacancies WHERE vacancy_number = $1";
$result = pg_query_params($conn, $query, array($vacancy_number));
if (pg_num_rows($result) === 0) {
    http_response_code(404); // вакансия с таким номером не существует
    die();
}
//echo "Страница с подробным описание вакансии - " . $vacancy_number;
$row = pg_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php echo $row["template_style_head"]; ?>
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/styles_index_page.css">
    <link rel="stylesheet" href="./assets/css/styles_detailed_vacancy_page.css">
    <title>Вакансия</title>
</head>

<body>
    <header>
        <h1>Вакансия Московского университета С.Ю. Витте</h1>
    </header>
    <main>
        <a href="http://localhost:3000/public/index.php" class="go_home"><u>Вернуться к списку вакансий</u></a>
        <div class="vacancy_header">
            <div class="title">Старший менеджер в клиентский отдел</div>
            <div class="education">Образование: неоконченное высшее</div>
            <div class="experience">Опыт работы: от 1 год до 3 лет</div>
            <div class="type_employment">Тип занятости: частичная занятость</div>
            <div class="word_schedule">График работы: полный день</div>
            <div class="word_format">Формат работы: на месте работодателя</div>
            <div class="salary">Оплата труда от 80000 до 100000 Р до вычета налога</div>
            <a href="" class="button-style"> Откликнуться</a>
        </div>
        <div class="detailed_description">
            <?php echo $row["vacancy_template_body"]; ?>
        </div>
    </main>
    <footer>
        <p>2025 &copy; МУИВ. Все права защищены.</p>
    </footer>
</body>

</html>
