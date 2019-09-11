class Mini extends KaT
{
    private $api;
    public function __construct($command, $payload)
    {
        parent::__construct($command, $payload);
    }
    public function set_api($api)
    {
        $this->api = $api;
    }
    public function get_api()
    {
        return $this->api;
    }
}
