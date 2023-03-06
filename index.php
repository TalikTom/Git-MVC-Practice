<?php

session_start();

define('BP',__DIR__ . DIRECTORY_SEPARATOR);
define('BP_APP', BP . 'app' . DIRECTORY_SEPARATOR);

$zaAutoload=[
    BP_APP . 'controller',
    BP_APP . 'core',
    BP_APP . 'model'
];

