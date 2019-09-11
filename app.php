<?php

if ($argc > 0) {$NL = "\n"; $RUNMODE = "cli";} else {$NL = "</br>"; $RUNMODE = "webserv";}
// echo getcwd() . $NL;

$mykatpath = __DIR__ . DIRECTORY_SEPARATOR . "src/mykat.hack";
$mykat = file_get_contents($mykatpath);
eval($mykat);

$minikatpath = __DIR__ . DIRECTORY_SEPARATOR . "src/minikat.hack";
$minikat = file_get_contents($minikatpath);
eval($minikat);

$kat = new KaT('test','this is a cool test');
$mini = new Mini('test','other function');
$mini->set_api("ethereum");

echo 'KaT command: ' . $kat->get_command() . $NL . 'KaT payload: ' . $kat->get_payload() . $NL . $NL;
echo 'MiniKaT: ' . $mini->get_command() . $NL .  'Mini payload: ' . $mini->get_payload() . $NL . $NL;
echo 'MiniKaT API: ' . $mini->get_api() . $NL;
