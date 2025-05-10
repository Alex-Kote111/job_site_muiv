<?php

session_start();

require __DIR__ . '/../includes/connect.php';
    /* print_r($_SESSION);
echo '<script>alert(Ошибка)</script>' */;
if (array_key_exists('error_sending_file', $_SESSION)) {
    echo '<script>alert("' . $_SESSION["error_sending_file"] . '")</script>';
    unset($_SESSION["error_sending_file"]);
}

if (empty($_SESSION["vacancy_number"])) {
    http_response_code(404);
    die();
}
unset($_SESSION["error"]);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/styles_index_page.css">
    <link rel="stylesheet" href="./assets/css/styles_questionnaire_page.css">
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <title>Анкета</title>
</head>

<body>
    <header>
        <img src="assets/images/logo-muiv-mini.svg" alt="" class="logo">
        <h1>Анкета</h1>
    </header>
    <main>
        <a href="http://localhost:3000/public/index.php" class="go_home"><u>Вернуться к списку вакансий</u></a>
        <!--   ../includes/captcha_check.php -->
        <form action="../includes/add_candidate.php" enctype="multipart/form-data" method="post" id="form">
            <label for=" username">ФИО: </label>
            <input placeholder="Ваше ФИО.." id="username" type="text" name="username" pattern="([a-яА-ЯЁё]{2,})+\s+([a-яА-ЯЁё]{2,})+\s+([a-яА-ЯЁё]{2,})+" required minlength="6" maxlength="150"><br>

            <label for="city">Город: </label>
            <input placeholder="Ваш город проживания.." id="city" type="text" name="city" maxlength="150" required><br>

            <label for="metro">Метро: </label>
            <input placeholder="Ваша станция метро.." id="metro" type="text" name="metro" maxlength="150"><br>

            <label for="education">Образование: </label>
            <select id="education" name="education" required>
                <option value=""></option>
                <option value="Среднее">Среднее</option>
                <option value="Среднее специальное">Среднее специальное</option>
                <option value="Неоконченное высшее">Неоконченное высшее</option>
                <option value="Высшее">Высшее</option>
                <option value="Бакалавр">Бакалавр</option>
                <option value="Магистр">Магистр</option>
                <option value="Кандидат наук">Кандидат наук</option>
                <option value="Доктор наук">Доктор наук</option>
            </select><br>

            <label for="salary">Заработная плата: </label>
            <input placeholder="Желаемая зарплата (в рублях)" type="text" name="salary" pattern="[0-9]+" minlength="4" maxlength="10" required><br>

            <label for="sex">Пол: </label>
            <select id="sex" name="sex" required>
                <option value=""></option>
                <option value="Мужской">Мужской</option>
                <option value="Женский">Женский</option>
            </select><br>

            <label for="date">Дата рождения: </label>
            <input id="date_birth" type="date" name="date_of_birth" required><br>

            <label for="email">Email: </label>
            <input placeholder="Ваш email.." type="email" name="email" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" maxlength="255" required><br>

            <label for="phone">Телефон: </label>
            <input placeholder="Ваш номер телефона в формате: 89098417612 (11 цифр)" type="text" name="phone" pattern="[0-9]+" minlength="11" maxlength="11" required><br>

            <label class="photo" for="photo">Прикрепить фото:</label>
            <input type="file" id="photo" name="photo" accept="image/jpeg,image/png" />

            <label class="resume" for="resume_file">Прикрепить резюме:</label>
            <input type="file" id="resume_file" name="resume_file" accept=".doc,.docx,.pdf,.rtf" />

            <div class="g-recaptcha" data-sitekey="6LcnkDErAAAAAAdGxrphfSUjiCTk95QkVMvQ_Lst"></div>

            <p class="consent_to_processing">Откликаясь на вакансию, вы даете свое согласие на обработку персональных данных</p>
            <button type="submit" class="button-style">Отправить</button>
        </form>
    </main>
    <footer>
        <p>2025 &copy; Котельников А.Б. 70153995. Все права защищены.</p>
    </footer>
    <script src="https://snipp.ru/cdn/jquery/2.1.1/jquery.min.js"></script>
    <script>
        $('#form').submit(function() {
            var response = grecaptcha.getResponse();
            if (response.length == 0) {
                alert('Вы не прошли проверку CAPTCHA должным образом');
                return false;
            }
        });
    </script>
</body>

</html>
