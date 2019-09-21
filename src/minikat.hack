class Mini extends KaT
{
    private $api;
    private $endpoint;
    private $id;
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

public function set_id($id)
    {
        $this->id = $id;
    }
    public function get_id()
    {
        return $this->id;
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

public function net_peercount($url, $id)
    {
        $method = "net_peerCount";
        $params = [];
        //setup request to send json via POST
        $data = array();
        $data['jsonrpc'] = "2.0";
        $data['id'] = $id;
        $data['method'] = $method;
        $data['params'] = $params;
        $payload = json_encode($data);
        //do the call
        $jsondata = KaT::jsonCurl($url, $method, $payload);
	return $jsondata;
     }

public function eth_blockNumber($url, $id)
    {
        $method = "eth_blockNumber";
        $params = [];
        //setup request to send json via POST
        $data = array();
        $data['jsonrpc'] = "2.0";
        $data['id'] = $id;
        $data['method'] = $method;
        $data['params'] = $params;
        $payload = json_encode($data);
        //do the call
        $jsondata = KaT::jsonCurl($url, $method, $payload);
        return $jsondata;
	}
}
