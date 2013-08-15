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
			'rules' => 'trim|max_length[100]'
		),
		'event_link' => array(
			'field' => 'event_link',
			'label' => 'event link ',
			'rules' => 'trim|htmlspecialchars|required|max_length[100]'
		),		
		'your_name' => array(
			'field' => 'your_name',
			'label' => 'name',
			'rules' => 'trim|required|max_length[100]'
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
		$this->load->helper(array('form', 'url'));
		$this->lang->load('event');
	}

	/**
	 * Shows the yourevent page	 
	 */
	 public function index(){
		
			$this->form_validation->set_rules($this->validation_rules);

			if ($this->form_validation->run())
			{
				//check if event exists.
				//FIXME
				//if (! $this->event_m->linkExists($link)){

				$gid = $this->event_m->insert(array(				
				'id'                => now(), //using timestamp as id.
				'title'				=> $this->input->post('event_title'),
				'slug'				=> "",
				'category_id'		=> 0,
				//'keywords'			=> Keywords::process($this->input->post('keywords')),
				'body'				=> "",
				'status'			=> "draft", //events imported from GCal are created as draft
				'created_on'		=> now(),  //convert time from 2013-07-06T13:30:37.000Z to unix timestamp					
				//'comments_enabled'	=> $this->input->post('comments_enabled'),
				//'author_id'			=> "",//$this->current_user->id,
				'type'				=> "wysiwyg-advanced",
				'parsed'			=> "",
                //'preview_hash'      => $hash,
				
				//added by xavi
				//'price'				=> $this->input->post('price'),
				'location'			=> "",
				'address'			=> "", 

                //already added before, need to convert to right format
                
                //'start_date'		=> strtotime($eventData["start_date"]),  //save date in timestamp format
                //'end_date'			=> strtotime($eventData["end_date"]),
                //'start_date'		=> $start_date,
                //'end_date'			=> $end_date,
				//'organizer'			=> $this->input->post('organizer'),
				//'organizer_link'	=> $this->input->post('organizer_link'),
				//'price'				=> $this->input->post('price'),
				'event_link'		=> $this->input->post('event_link'),
 				//'language'			=> $this->input->post('language'),
 			));

	 		$this->pyrocache->delete_all('event_m');
	 		$this->session->set_flashdata('success', sprintf($this->lang->line('event:post_add_success'), $this->input->post('title')));
			
	 		// Event article has been updated, may not be anything to do with publishing though
	 		Events::trigger('post_created', $gid);
	 			
	 		//redirect to success page
	 		//$this->success();
	 		redirect('submit/success');
	 		}
	 		else
	 		{
				$your_event = new stdClass;
	            $this->your_event = new stdClass;
	            foreach ($this->validation_rules as $key => $field)
	            {
		            $your_event->$field['field'] = set_value($field['field']);
		            $this->your_event->$field['field'] = set_value($field['field']);
		        }
	
				$this->template
					->title($this->module_details['name'])
					->set_breadcrumb(lang('event:event_title'))
					->set('your_event',$this->your_event)
					->set_layout('submit.html')
					->build('submit-event');
			}
	}

	public function success(){
		$this->template
			->title($this->module_details['name'])
			->set_layout('submit.html')			
			->build('success');			
	}
	
}