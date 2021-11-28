<?php
ini_set('allow_url_fopen','1');
return [
    'active' => true, // set true for Disable Send Email Or set false for Enable Send Email
    'host'=>'smtp.gmail.com',
    'adminEmail' => 'your_email@gmail.com',// Gmail Account
    'password' => 'your_password',//password Gmail account*/
    'port' => '587',
    'encryption' => 'tls',

    /*Email Title*/
    'email_send_from' => 'ระบบแจ้งซ่อมคอมพิวเตอร์',

    'email_subject' => 'แจ้งซ่อมคอมพิวเตอร์ '.date("Y/m/d"),

    /*Line Token*/
     'line_token' => '',
];
