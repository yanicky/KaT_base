// To be used with hhvm-cli in console (ie: hhvm index.hh --wallet=yourwalletaddresshere)
foreach( $argv as $argument ) {
        if( $argument == $argv[ 0 ] ) continue;

        $pair = explode( "=", $argument );
        $variableName = substr( $pair[ 0 ], 2 );
        if(isset($pair[ 1 ])){
        $variableValue = $pair[ 1 ];
        //echo $variableName . " = " . $variableValue . "\n";
        // Store the variable in $_REQUEST
        $_REQUEST[ $variableName ] = $variableValue;
        }
}


if ($argc > 0) {$NL = "\n"; $RUNMODE = "cli";} else {$NL = "</br>"; $RUNMODE = "webserv";}
// echo getcwd() . $NL;

$mykatpath = __DIR__ . DIRECTORY_SEPARATOR . "src/mykat.hack";
$mykat = file_get_contents($mykatpath);
eval($mykat);

$minikatpath = __DIR__ . DIRECTORY_SEPARATOR . "src/minikat.hack";
$minikat = file_get_contents($minikatpath);
eval($minikat);

if(isset($_REQUEST["cmd"]) == false){
	$_REQUEST["cmd"] = "help";
	$mypayload["cmd"] = "help";
	$mypayload["id"] = 1;
	$_REQUEST["id"] = 1;
	$mycmd = "test";
	$mini = new Mini($mycmd ,$mypayload);
	}
else
	{
$mini = new Mini($_REQUEST["cmd"] ,$_REQUEST);
}
$mini->set_api("pirl");
$mini->set_endpoint("https://wallrpc.pirl.io");

if(isset($_REQUEST["id"]) == false){
$mini->set_id(1);
} else {
$mini->set_id($_REQUEST["id"]);
}

switch ($_REQUEST["cmd"])
        {
        case "version":
        echo $mini->get_katversion() . $NL;
        break;

        case "help":
        echo $mini->get_kathelp() . $NL;
        break;

	case "net_peercount":
	// echo $mini->get_id() . $NL;
	echo $mini->net_peercount($mini->get_endpoint(), $mini->get_id());
	break;

	case "eth_blockNumber":
        // echo $mini->get_id() . $NL;
        echo $mini->eth_blockNumber($mini->get_endpoint(), $mini->get_id());
        break;

        default:
        echo 'MiniKaT: ' . $mini->get_command() . $NL .  'Mini payload: ' . print_r( $mini->get_payload()) . $NL . $NL;
        echo 'MiniKaT API: ' . $mini->get_api() . $NL . 'Extracted load: ' . $mini->extract_payload() . $NL . $NL;
        break;
        }
