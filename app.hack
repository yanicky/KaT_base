$mykatpath = __DIR__ . DIRECTORY_SEPARATOR . "src/mykat.hack";
$mykat = file_get_contents($mykatpath);
eval($mykat);

$minikatpath = __DIR__ . DIRECTORY_SEPARATOR . "src/minikat.hack";
$minikat = file_get_contents($minikatpath);
eval($minikat);

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


if ($argc > 0) {$RUNMODE = "cli";}
else {$RUNMODE = "webserv";}

if(isset($_REQUEST["cmd"]) == false){
	$_REQUEST["cmd"] = "help";
	$_REQUEST["id"] = 1;
	}


$mini = new Mini($_REQUEST["cmd"] ,$_REQUEST);


$mini->set_newline($RUNMODE);
$NL = $mini->get_newline();

if(isset($_REQUEST["api"]) == false){
$mini->set_api("pirl");
} else {
$mini->set_api($_REQUEST["api"]);
}

if(isset($_REQUEST["endpoint"]) == false){
	switch($mini->get_api()){
	case "pirl":
	$mini->set_endpoint("https://wallrpc.pirl.io");
	break;

	case "ethereum":
	$mini->set_endpoint("https://cloudflare-eth.com");
	break;
	
	case "ganache":
	$mini->set_endpoint("http://127.0.0.1:7545");
	break;
	
	default:
	$mini->set_endpoint("https://wallrpc.pirl.io");
	break;
	}
} else {
$mini->set_endpoint($_REQUEST["endpoint"]);
}

if(isset($_REQUEST["id"]) == false){
$mini->set_id(1);
} else {
$mini->set_id($_REQUEST["id"]);
}
if(isset( $_REQUEST["wallet"]) == false ) {
$wallet = "0x256b2b26Fe8eCAd201103946F8C603b401cE16EC";
}else {
$wallet = $_REQUEST["wallet"];
}

switch ($_REQUEST["cmd"])
        {
        case "version":
        echo $mini->get_katversion() . $NL;
        break;

        case "help":
        echo $mini->get_kathelp() . $NL;
        break;

	case "howto":
        echo $mini->get_kathowto() . $NL;
        break;

	case "web3_clientVersion":
        echo $mini->Web3_clientVersion($mini->get_endpoint(), $mini->get_id());
        break;
	
	case "net_version":
        echo $mini->net_version($mini->get_endpoint(), $mini->get_id());
        break;

	case "net_peercount":
	echo $mini->net_peercount($mini->get_endpoint(), $mini->get_id());
	break;

	case "eth_blockNumber":
        echo $mini->eth_blockNumber($mini->get_endpoint(), $mini->get_id());
        break;

	case "eth_getBlockByNumber":
        echo $mini->eth_getBlockByNumber($mini->get_endpoint(), $mini->get_id(), $_REQUEST["block"]);
        break;

	case "eth_getBlockByHash":
        echo $mini->eth_getBlockByHash($mini->get_endpoint(), $mini->get_id(), $_REQUEST["block"]);
        break;

	case "eth_getBalance":
	if ($wallet == "" ) {echo "url should be in format 'http(s)://hostname/path/to/index.php?wallet=youraddresshere' or using --wallet=yourwallethere from hhvm-cli"  . $NL; exit;}
        else{
	if ( strlen($wallet) != "42" ) { echo "wallet should be 42 char, including the 0x beginning" . $NL; exit;}else{

	echo $mini->eth_getBalance($mini->get_endpoint(), $mini->get_id(), $wallet);
		}
        }
	break;

	case "eth_getDecodedBalance":
        if ($wallet == "" ) {echo "url should be in format 'http(s)://hostname/path/to/index.php?wallet=youraddresshere' or using --wallet=yourwallethere from hhvm-cli"  . $NL; exit;}
        else{
        if ( strlen($wallet) != "42" ) { echo "wallet should be 42 char, including the 0x beginning" . $NL; exit;}else{

        echo $mini->eth_getDecodedBalance($mini->get_endpoint(), $mini->get_id(), $wallet);
                }
        }
        break;

        default:
        echo 'MiniKaT: ' . $mini->get_command() . $NL .  'Mini payload: ' . print_r( $mini->get_payload()) . $NL . $NL;
        echo 'MiniKaT API: ' . $mini->get_api() . $NL . 'Extracted load: ' . $mini->extract_payload() . $NL . $NL;
        break;
        }
