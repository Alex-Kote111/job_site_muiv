<?php
function get_payment_format($salary_from, $salary_up_to, $before_tax)
{
    $payment_terms = ""; // условия оплаты
    if (is_null($salary_from) && !is_null($salary_up_to)) {
        $payment_terms .= "Оплата труда до: " . $salary_up_to . " ₽ за месяц";
    } elseif (!is_null($salary_from) && is_null($salary_up_to)) {
        $payment_terms .= "Оплата труда от: " . $salary_from . " ₽ за месяц";
    } elseif (!is_null($salary_from) && !is_null($salary_up_to)) {
        $payment_terms .= "Оплата труда от: " . $salary_from . " до: " . $salary_up_to . " ₽ за месяц";
    }

    if ($before_tax === "t" && (!is_null($salary_from) || !is_null($salary_up_to))) {
        $payment_terms .= " (до вычета налога)";
    }
    echo $payment_terms;
}
