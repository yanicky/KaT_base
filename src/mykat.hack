class KaT
{
    private $command;
    private $payload;
    private $newline;
    private $KaT_VERSION = "3.0";
    public function __construct($command, $payload)
    {
        $this->command = $command;
        $this->payload = $payload;
    }
    public function get_katversion()
    {
	return $this->KaT_VERSION;
    }
    public function get_kathelp()
    {
        return "Please use --cmd=howto";
    }
    public function get_kathowto()
    {
        $howto = file_get_contents('https://raw.githubusercontent.com/yanicky/KaT_base/master/HOWTO.md');
        return $howto;
    }
    public function get_command()
    {
        return $this->command;
    }
    public function set_command($command)
    {
        $this->command = $command;
    }
    public function get_payload()
    {
        return $this->payload;
    }
    public function set_payload($payload)
    {
        $this->payload = $payload;
    }
    public function extract_payload()
    {
        $load = $this->payload;
        return $load["cmd"];
    }

    public function set_newline($runmode)
    {
    if($runmode == "cli"){
        $newline   = "\n";
        } else {
        $newline = "</br>";
        }
     $this->newline = $newline;
    }
    public function get_newline()
    {
     return $this->newline;
    }
    public function jsonCurl($myurl, $mymethod, $mypayload) 
    {
	//create a new cURL resource
	$ch = curl_init($myurl);
	curl_setopt($ch, CURLOPT_POST, TRUE);
	//attach encoded JSON string to the POST fields
	curl_setopt($ch, CURLOPT_POSTFIELDS, $mypayload);
	//set the content type to application/json
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Content-Type:application/json'));
	//return response instead of outputting
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	//execute the POST request
	$res = curl_exec($ch);
	//close cURL resource
	curl_close($ch);
	//return the result
	return $res;
    }
}
