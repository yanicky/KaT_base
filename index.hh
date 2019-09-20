<?hh

$myapppath = __DIR__ . DIRECTORY_SEPARATOR . "app.hack";
$myapp = file_get_contents($myapppath);
eval($myapp);
