<?php
function format_publication_date($inputDate)
{
    // Создаем объект DateTime
    $date = DateTime::createFromFormat('Y-m-d', $inputDate);
    // Проверяем корректность даты
    if ($date) {
        // Массив русских названий месяцев
        $months = [
            1 => 'января',
            2 => 'февраля',
            3 => 'марта',
            4 => 'апреля',
            5 => 'мая',
            6 => 'июня',
            7 => 'июля',
            8 => 'августа',
            9 => 'сентября',
            10 => 'октября',
            11 => 'ноября',
            12 => 'декабря'
        ];
        // Форматируем дату
        $day = $date->format('j');
        $month = $months[(int)$date->format('n')];
        $year = $date->format('Y');

        $resultDate = "Вакансия опубликована $day $month $year года";
        echo $resultDate;
    }
}
