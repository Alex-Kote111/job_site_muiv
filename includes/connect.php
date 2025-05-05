<?php
$conn = pg_connect("host=localhost dbname=recruitment_db user=postgres password=qwer123");
if (!$conn) {
    die("Ошибка подключения: " . pg_last_error());
}
