class KaT
{
    private $command;
    private $payload;
    public function __construct($command, $payload)
    {
        $this->command = $command;
        $this->payload = $payload;
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
}
