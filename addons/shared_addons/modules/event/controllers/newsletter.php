<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Public Newsletter module controller
 *
 * @author		PyroCMS Dev Team
 * @package 	PyroCMS\Core\Modules\Event\Controllers
 */
class Newsletter extends Public_Controller
{
	protected $validation_rules = array(
		'newsletter_name' => array(
			'field' => 'newsletter_name',
			'label' => 'name',
			'rules' => 'trim|alpha|required|max_length[100]'
		),
		'newsletter_email' => array(
			'field' => 'newsletter_email',
			'label' => 'email',
			'rules' => 'trim|valid_email|required|max_length[100]'
		));	
	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
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
		
		$this->form_validation->set_rules($this->validation_rules);

		if ($this->form_validation->run())
		{
			//$this->template->set_layout(false);
			$post_data = $this->input->post();
			//Array ( [ajax] => true [fname] => Xavier [lname] => Amoros [email] => xaviamoros@gmail.com ) 
			

/*
			
			$post_data=
			(
				[ajax] => true
				[newsletter_name] => Test
				[newsletter_email] => xaviamoros@gmail.com
			)
*/

			if (!$post_data) {
	        	//exit('No direct script access allowed');
	   	        $data=array("subscribe_error"=>"There was an error adding your email #ERROR_1");
	        } 
	        else 
	        {
	//	        if($this->mail_chimp->listSubscribe($list_id,$post_data["email"])) {
				$merge_vars=array('FNAME'=>$post_data['newsletter_name']);
		        if($this->mail_chimp->listSubscribe($list_id,$post_data['newsletter_email'],$merge_vars)) {
	             	// $email is now subscribed to list with id: $list_id
	             	$data=array("subscribe_ok"=>"Email added to newletter");
	            }
	            else{
	             	$data=array("subscribe_error"=>"There was an error adding your email");	            
	            }
	        }       
	    }else{
	    	$data = array(
	    		'newsletter_name' => form_error('newsletter_name'),
	    		'newsletter_email' => form_error('newsletter_email')
            );
            //echo json_encode("Validation not passed");
	    }
	    echo json_encode($data);
 
    }	
}