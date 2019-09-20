class Mini extends KaT
{
    private $api;
    private $endpoint;
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
public function set_endpoint($endpoint)
    {
        $this->endpoint = $endpoint;
    }
    public function get_endpoint()
    {
        return $this->endpoint;
    }
    public function get_url()
    {
        $load = KaT::get_payload();
        return KaT::get_command() . ":" . $this->endpoint . "/" . $load[0] . "/" . $load[1];
    }
}
