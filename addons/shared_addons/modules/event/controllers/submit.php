<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Public Event module controller
 *
 * @author		PyroCMS Dev Team
 * @package 	PyroCMS\Core\Modules\Event\Controllers
 */
class Submit extends Public_Controller
{
	protected $validation_rules = array(
		'event_title' => array(
			'field' => 'event_title',
			'label' => 'event title ',
			'rules' => 'trim|required|max_length[100]'
		),
		'event_link' => array(
			'field' => 'event_link',
			'label' => 'event link ',
			'rules' => 'trim|htmlspecialchars|required|max_length[100]'
		),		
		'your_name' => array(
			'field' => 'your_name',
			'label' => 'name',
			'rules' => 'trim|alpha|required|max_length[100]'
		),
		'your_email' => array(
			'field' => 'your_email',
			'label' => 'email',
			'rules' => 'trim|valid_email|required|max_length[100]'
		)
	);
    var	$your_event=array();

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('event_m');
		$this->load->model('event_categories_m');
		$this->load->model('comments/comments_m');
		$this->load->library(array('keywords/keywords', 'form_validation'));

		$this->lang->load('event');
	}

	/**
	 * Shows the yourevent page	 
	 */
	 public function index(){
		
		$this->yourevent();
		//$this->load->view('about');
		// Set meta description based on post titles
		//$meta = $this->_posts_metadata($_event);

		
		/*
		$this->	template
			//->title($this->module_details['name'])
			->set_breadcrumb(lang('event:event_title'))
			->set_metadata('description', $meta['description'])
			->set_metadata('keywords', $meta['keywords'])
			->set('your_event',$this->your_event);
			//->build('your-event');
		*/	
	}
	
	public function submit_your_event(){
		$this->form_validation->set_rules($this->validation_rules);
		echo "FORM VALIDATION OK";

		if ($this->form_validation->run())
		{
			echo "FORM VALIDATION OK";
			$this->yourevent();
		}
		else
		{
			echo "FORM VALIDATION ERROR";
			// Go through all the known fields and get the post values
			$your_event = new stdClass;
			foreach ($this->validation_rules as $key => $field)
			{
				$your_event->$field['field'] = set_value($field['field']);
			}
		}
	}
	 
	 
	public function yourevent()
	{
		// Set meta description based on post titles
		//$meta = $this->_posts_metadata($_event);
		
		
/*
		$this->your_event=array(
			'your_name'=>"name",
			'your_email'=>"email",
			'event_link'=>"event_link",
			'title'=>"title"
		);
*/

		/*
		if($this->input->is_ajax_request()){
		}
		else{
		}
*/
			//->set_metadata('description', $meta['description'])
			//->set_metadata('keywords', $meta['keywords'])

		$this->form_validation->set_rules($this->validation_rules);

		if ($this->form_validation->run())
		{
			$this->template
			->title($this->module_details['name'])
			->build('success');

		}
		else
		{
			// Go through all the known fields and get the post values
			$this->your_event = new stdClass;
			foreach ($this->validation_rules as $key => $field)
			{
				$this->your_event->$field['field'] = set_value($field['field']);
			}
			$this->template
			->title($this->module_details['name'])
			->set_breadcrumb(lang('event:event_title'))
			->set('your_event',$this->your_event)
			->build('your-event');

		}
		
	}
}