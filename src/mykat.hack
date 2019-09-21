class KaT
{
    private $command;
    private $payload;
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

}
