<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Public Newsletter module controller
 *
 * @author		PyroCMS Dev Team
 * @package 	PyroCMS\Core\Modules\Event\Controllers
 */
class Newsletter extends Public_Controller
{
	
	public function __construct()
	{
		parent::__construct();
		$this->load->model('event_m');
		/*
		$this->load->model('event_categories_m');
		$this->load->model('comments/comments_m');
		$this->load->library(array('keywords/keywords'));
		$this->lang->load('event');
		*/

		$config = array(
	    	'apikey' => 'd44ce91a956af4811bf6efe69e1af5cb-us6',      // Insert your api key
            'secure' => FALSE   // Optional (defaults to FALSE)
        );
        $this->load->library('MCAPI', $config, 'mail_chimp');
	}
	
	public function index(){
	}

	public function subscribe(){
		$list_id="00ab6731c0";
		
		//$this->template->set_layout(false);
		$post_data = $this->input->post();
		//Array ( [ajax] => true [fname] => Xavier [lname] => Amoros [email] => xaviamoros@gmail.com ) 

		if (!$post_data) {
        	//exit('No direct script access allowed');
   	        echo json_encode("There was an error adding your email");
        } 
        else 
        {
                       
	        if($this->mail_chimp->listSubscribe($list_id,$post_data["email"])) {
            	// $email is now subscribed to list with id: $list_id
            	echo json_encode("Email added to newletter");
            }
        }        
    }	
}