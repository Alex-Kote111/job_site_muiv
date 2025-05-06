<?php
require __DIR__ . '/../includes/connect.php';
require __DIR__ . '/../includes/payment_format.php';

$vacancy_number = $_GET["vacancy_number"];

$query = "SELECT * FROM vacancies WHERE vacancy_number = $1";
$result = pg_query_params($conn, $query, array($vacancy_number));
if (pg_num_rows($result) === 0) {
    http_response_code(404); // вакансия с таким номером не существует
    die();
}
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
            <div class="title"><?php echo $row["vacancy_title"]; ?></div>
            <div class="education"><?php echo "Образование: " . mb_strtolower($row["education"], 'UTF-8'); ?></div>
            <div class="experience"><?php echo "Опыт работы: " . mb_strtolower($row["experience"], 'UTF-8'); ?></div>
            <div class="type_employment"><?php echo "Тип занятости: " . mb_strtolower($row["type_of_employment"], 'UTF-8'); ?></div>
            <div class="word_schedule"><?php echo "График работы: " . mb_strtolower($row["work_schedule"], 'UTF-8'); ?></div>
            <div class="word_format"><?php echo "Формат работы: " . mb_strtolower($row["work_format"], 'UTF-8'); ?></div>
            <div class="salary"><?php get_payment_format($row["salary_from"], $row["salary_up_to"], $row["before_tax"]) ?></div>
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
