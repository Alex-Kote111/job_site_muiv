<?php
require __DIR__ . '/../includes/brief_description_vacancy.php';
require __DIR__ . '/../includes/payment_format.php';

session_start();
if (array_key_exists('error', $_SESSION)) {
    if ($_SESSION["error"]) {
        echo "<script>alert('Не удалось отправить анкету. Капча не была пройдена или была попытка отправить одну и ту же анкету.')</script>";
    } elseif ($_SESSION["error"] === false) {
        echo "<script>alert('Анкета успешно отправлена')</script>";
    }
    unset($_SESSION["error"]);
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/styles_index_page.css">
    <title>Список вакансий</title>
</head>

<body>
    <header>
        <img src="assets/images/logo-muiv-mini.svg" alt="" class="logo">
        <h1>Вакансии Московского университета С.Ю. Витте</h1>
    </header>
    <main>
        <?php
        if (pg_num_rows($result) == 0) { ?>
            <div class="no_vacancies"><?php echo "На данный момент нет открытых вакансий."; ?></div>
            <?php
        } else {
            while ($row = pg_fetch_assoc($result)) {
            ?>
                <div class="vacancy_block">
                    <div class="vacancy_title"><?php echo $row['vacancy_title'] ?></div>
                    <div class="vacancy_salary">
                        <?php get_payment_format($row["salary_from"], $row["salary_up_to"], $row["before_tax"]) ?>
                    </div>
                    <div class="vacancy_experience"><?php echo "Опыт: " . mb_strtolower($row['experience'], 'UTF-8') ?></div>
                    <div class="vacancy_type_of_employment"><?php echo $row['type_of_employment'] ?></div>
                    <a href="<?php echo "http://localhost:3000/public/detailed_vacancy_page.php?vacancy_number=" . $row['vacancy_number']; ?>" class="button-style">Подробнее</a>
                </div>
        <?php
            }
        }
        ?>
    </main>
    <footer>
        <p>2025 &copy; Котельников А.Б. 70153995. Все права защищены.</p>
    </footer>
</body>

</html>
