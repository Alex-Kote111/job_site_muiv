<?php
require __DIR__ . '/../includes/brief_description_vacancy.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/styles.css">
    <title>Document</title>
</head>

<body>
    <header>
        <h1>Вакансии Московского университета С.Ю. Витте</h1>
    </header>
    <main>
        <?php
        if (pg_num_rows($result) == 0) { ?>
            <div class="no_vacancies"><?php echo "В данный момент нет открытых вакансий.";  ?></div>
            <?php
        } else {
            while ($row = pg_fetch_assoc($result)) {
            ?>
                <div class="vacancy_block">
                    <div class="vacancy_title"><?php echo $row['vacancy_title'] ?></div>
                    <div class="vacancy_salary">
                        <?php
                        $payment_terms = ""; // условия оплаты
                        if (is_null($row['salary_from']) && !is_null($row['salary_up_to'])) {
                            $payment_terms .= "Оплата труда до: " . $row['salary_up_to'] . " ₽ за месяц";
                        } elseif (!is_null($row['salary_from']) && is_null($row['salary_up_to'])) {
                            $payment_terms .= "Оплата труда от: " . $row['salary_from'] . " ₽ за месяц";
                        } elseif (!is_null($row['salary_from']) && !is_null($row['salary_up_to'])) {
                            $payment_terms .= "Оплата труда от: " . $row['salary_from'] . " до: " . $row['salary_up_to'] . " ₽ за месяц";
                        }

                        if ($row['before_tax'] === "t" && (!is_null($row['salary_from']) || !is_null($row['salary_up_to']))) {
                            $payment_terms .= " (до вычета налога)";
                        }
                        echo $payment_terms;
                        ?>
                    </div>
                    <div class="vacancy_experience"><?php echo "Опыт: " . $row['experience'] ?></div>
                    <div class="vacancy_type_of_employment"><?php echo $row['type_of_employment'] ?></div>
                    <a href="" class="button-style">Подробнее</a>
                </div>
        <?php
            }
        }
        ?>
    </main>
    <footer>
        <p>2025 &copy; МУИВ. Все права защищены.</p>
    </footer>
</body>

</html>
