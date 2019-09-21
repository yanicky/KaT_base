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


public function web3_clientVersion($url, $id)
    {
        $method = "web3_clientVersion";
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


public function net_version($url, $id)
    {
        $method = "net_version";
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

public function eth_getBlockByNumber($url, $id, $blocknumber)
    {
        $method = "eth_getBlockByNumber";
        $params = [$blocknumber, true];
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

public function eth_getBlockByHash($url, $id, $blockhash)
    {
        $method = "eth_getBlockByHash";
        $params = [$blockhash, true];
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

public function eth_getBalance($url, $id, $addr)
    {
        $method = "eth_getBalance";
        $params = array($addr, "latest");
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
public function eth_getDecodedBalance($url, $id, $addr)
    {
        $method = "eth_getBalance";
        $params = array($addr, "latest");
        //setup request to send json via POST
        $data = array();
        $data['jsonrpc'] = "2.0";
        $data['id'] = $id;
        $data['method'] = $method;
        $data['params'] = $params;
        $payload = json_encode($data);
        //do the call
        $jsondata1 = json_decode(KaT::jsonCurl($url, $method, $payload), false);
	$balance_val = $jsondata1->result;
        $pirl = number_format((hexdec($balance_val)/1000000000000000000), 10, ".", "");
        $assocArray = array();
        $assocArray['wallet'] = ''.$addr.'';
        $assocArray['balance'] = ''.$pirl.'';
	//encode in json format
	$jsondata = json_encode($assocArray);
        return $jsondata;
        }
}
