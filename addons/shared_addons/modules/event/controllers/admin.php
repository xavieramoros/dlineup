<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * 
 * @author 		PyroCMS Dev Team
 * @package 	PyroCMS\Core\Modules\Event\Controllers
 */
class Admin extends Admin_Controller
{
	/**
	 * The current active section
	 *
	 * @var string
	 */
	protected $section = 'events';  //IMPORTANT! Was needed to display the "add event" button.

	/**
	 * Array that contains the validation rules
	 *
	 * @var array
	 */
	protected $validation_rules = array(
		'title' => array(
			'field' => 'title',
			'label' => 'lang:global:title',
			'rules' => 'trim|htmlspecialchars|required|max_length[100]|callback__check_title'
		),
		'slug' => array(
			'field' => 'slug',
			'label' => 'lang:global:slug',
			'rules' => 'trim|required|alpha_dot_dash|max_length[100]|callback__check_slug'
		),
		array(
			'field' => 'category_id',
			'label' => 'lang:event:category_label',
			'rules' => 'trim|numeric'
		),
		array(
			'field' => 'keywords',
			'label' => 'lang:global:keywords',
			'rules' => 'trim'
		),
		array(
			'field' => 'intro',
			'label' => 'lang:event:intro_label',
			'rules' => 'trim|required'
		),
		array(
			'field' => 'body',
			'label' => 'lang:event:content_label',
			'rules' => 'trim|required'
		),
		array(
			'field' => 'type',
			'rules' => 'trim|required'
		),
		array(
			'field' => 'status',
			'label' => 'lang:event:status_label',
			'rules' => 'trim|alpha'
		),
		array(
			'field' => 'created_on',
			'label' => 'lang:event:date_label',
			'rules' => 'trim|required'
		),
		array(
			'field' => 'created_on_hour',
			'label' => 'lang:event:created_hour',
			'rules' => 'trim|numeric|required'
		),
		array(
			'field' => 'created_on_minute',
			'label' => 'lang:event:created_minute',
			'rules' => 'trim|numeric|required'
		),
        array(
			'field' => 'comments_enabled',
			'label'	=> 'lang:event:comments_enabled_label',
			'rules'	=> 'trim|numeric'
		),
        array(
            'field' => 'preview_hash',
            'label' => '',
            'rules' => 'trim'
        ),
        //add new fields
   		array(
			'field' => 'start_date',
			'label' => 'lang:event:start_date',
			'rules' => 'trim|required'
		),
		/*
		array(
			'field' => 'starts_on_hour',
			'rules' => 'trim|numeric|required'
		),
		
		array(
			'field' => 'starts_on_minute',
			'rules' => 'trim|numeric|required'
		),
		*/
   		array(
			'field' => 'end_date',
			'label' => 'lang:event:end_date',
			'rules' => 'trim'
		),
		array(
			'field' => 'ends_on_hour',
			'rules' => 'trim|numeric'
		),
		array(
			'field' => 'ends_on_minute',
			'rules' => 'trim|numeric'
		),
		array(
			'field' => 'price',
			'label' => 'lang:event:price',
			'rules' => 'trim'
		),
		array(
			'field' => 'location',
			'label' => 'lang:event:location',
			'rules' => 'trim'
		),
		array(
			'field' => 'address',
			'label' => 'lang:event:address',
			'rules' => 'trim'
		),
		array(
			'field' => 'organizer',
			'label' => 'lang:event:organizer',
			'rules' => 'trim'
		),
		array(
			'field' => 'link',
			'label' => 'lang:event:event_link',
			'rules' => 'trim|prep_url|required'
		),
		array(
			'field' => 'language',
			'label' => 'lang:event:event_language',
			'rules' => 'trim'
		)
    );

	/**
	 * The constructor
	 */
	public function __construct()
	{
		parent::__construct();
		
		$this->load->model(array('event_m', 'event_categories_m'));
		$this->lang->load(array('event', 'categories'));
		
		$this->load->library(array('keywords/keywords', 'form_validation'));

		// Date ranges for select boxes
		
		$this->template
			->set('hours', array_combine($hours = range(0, 23), $hours))
			->set('minutes', array_combine($minutes = range(0, 59), $minutes))
		;
		
		/*
		// Date ranges for start date
		$this->template
			->set('start_hours', array_combine($start_hours = range(0, 23), $start_hours))
			->set('start_minutes', array_combine($start_minutes = range(0, 59), $start_minutes))
		;

		// Date ranges for end date
		$this->template
			->set('end_hours', array_combine($end_hours = range(0, 23), $end_hours))
			->set('end_minutes', array_combine($end_minutes = range(0, 59), $end_minutes))
		;
		*/

		$_categories = array();
		if ($categories = $this->event_categories_m->order_by('title')->get_all())
		{
			foreach ($categories as $category)
			{
				$_categories[$category->id] = $category->title;
			}
		}
		$this->template->set('categories', $_categories);
	}

	/**
	 * Show all created event posts
	 * 
	 * @return void
	 */
	public function index()
	{
		//set the base/default where clause
		$base_where = array('show_future' => TRUE, 'status' => 'all');

		//add post values to base_where if f_module is posted
		if ($this->input->post('f_category')) 	$base_where['category'] = $this->input->post('f_category');
		if ($this->input->post('f_status')) 	$base_where['status'] 	= $this->input->post('f_status');
		if ($this->input->post('f_keywords')) 	$base_where['keywords'] = $this->input->post('f_keywords');

		// Create pagination links
		$total_rows = $this->event_m->count_by($base_where,array('status' => 'live', 'month' => '2'));
		
		$pagination = create_pagination('admin/event/index', $total_rows);

		// Using this data, get the relevant results
		$event = $this->event_m->limit($pagination['limit'])->get_many_by($base_where);

		//do we need to unset the layout because the request is ajax?
		$this->input->is_ajax_request() and $this->template->set_layout(FALSE);

		$this->template
			->title($this->module_details['name'])
			->append_js('admin/filter.js')
			->set_partial('filters', 'admin/partials/filters')
			->set('pagination', $pagination)
			->set('event', $event);

		$this->input->is_ajax_request()
			? $this->template->build('admin/tables/posts')
			: $this->template->build('admin/index');

	}

	/**
	 * Create new post
	 *
	 * @return void
	 */
	public function create()
	{
		$this->form_validation->set_rules($this->validation_rules);

		//xavi
		//create timestamp value from Date:
		if ($this->input->post('start_date'))
		{
			//echo("retrieved_start_date:".$this->input->post('start_date'));
			//echo("retrieved_start_date after sprint:".sprintf('%s', $this->input->post('start_date')));
			
			$start_date = strtotime(sprintf('%s', $this->input->post('start_date')));
			//$start_date = strtotime("2013-03-25");
			//echo("unix_start_date:".$start_date);
		}
		else
		{
			$start_date = now();
		}	
		
		if ($this->input->post('end_date'))
		{
			$end_date = strtotime(sprintf('%s', $this->input->post('end_date')));
		}
		else
		{
			$end_date = now();
		}	

		if ($this->input->post('created_on'))
		{
			$created_on = strtotime(sprintf('%s %s:%s', $this->input->post('created_on'), $this->input->post('created_on_hour'), $this->input->post('created_on_minute')));
		}

		else
		{
			$created_on = now();
		}
        $hash = $this->_preview_hash();

		if ($this->form_validation->run())
		{
			// They are trying to put this live
			if ($this->input->post('status') == 'live')
			{
				role_or_die('event', 'put_live');

                $hash = "";
			}

			if ($id = $this->event_m->insert(array(
				'title'				=> $this->input->post('title'),
				'slug'				=> $this->input->post('slug'),
				'category_id'		=> $this->input->post('category_id'),
				'keywords'			=> Keywords::process($this->input->post('keywords')),
				'intro'				=> $this->input->post('intro'),
				'body'				=> $this->input->post('body'),
				'status'			=> $this->input->post('status'),
				'created_on'		=> $created_on,
				'comments_enabled'	=> $this->input->post('comments_enabled'),
				'author_id'			=> $this->current_user->id,
				'type'				=> $this->input->post('type'),
				'parsed'			=> ($this->input->post('type') == 'markdown') ? parse_markdown($this->input->post('body')) : '',
                'preview_hash'      => $hash,
				//added by xavi
				'price'				=> $this->input->post('price'),
				'location'			=> $this->input->post('location'),
				'address'			=> $this->input->post('address'),
				'location'			=> $this->input->post('location'),

                //already added before, need to convert to right format
                //'start_date'		=> $this->input->post('start_date'),
                //'end_date'			=> $this->input->post('end_date'),
                'start_date'		=> $start_date,
                'end_date'			=> $end_date,
				'organizer'			=> $this->input->post('organizer'),
				'price'				=> $this->input->post('price'),
				'link'				=> $this->input->post('link'),
 				'language'			=> $this->input->post('language'),
			
			)))
			{
				$this->pyrocache->delete_all('event_m');
				$this->session->set_flashdata('success', sprintf($this->lang->line('event:post_add_success'), $this->input->post('title')));
				
				// Event article has been updated, may not be anything to do with publishing though
				Events::trigger('post_created', $id);

				// They are trying to put this live
				if ($this->input->post('status') == 'live')
				{
					// Fire an event, we're posting a new event!
					Events::trigger('post_published', $id);
				}
			}
			else
			{
				$this->session->set_flashdata('error', lang('event:post_add_error'));
			}

			// Redirect back to the form or main page
			$this->input->post('btnAction') == 'save_exit' ? redirect('admin/event') : redirect('admin/event/edit/' . $id);
		}
		else
		{
			// Go through all the known fields and get the post values
			$post = new stdClass;
			foreach ($this->validation_rules as $key => $field)
			{
				$post->$field['field'] = set_value($field['field']);
			}
			$post->created_on = $created_on;
			$post->end_date = $end_date;
			$post->start_date = $start_date;

			// if it's a fresh new article lets show them the advanced editor
			$post->type or $post->type = 'wysiwyg-advanced';
		}

		$this->template
			->title($this->module_details['name'], lang('event:create_title'))
			->append_metadata($this->load->view('fragments/wysiwyg', $this->data, TRUE))
			->append_js('jquery/jquery.tagsinput.js')
			->append_js('module::event_form.js')
			->append_css('jquery/jquery.tagsinput.css')
			->set('post', $post)
			->build('admin/form');
	}

	/**
	 * Edit event post
	 *
	 * 
	 * @param int $id the ID of the event post to edit
	 * @return void
	 */
	public function edit($id = 0)
	{
		$id OR redirect('admin/event');

		$post = $this->event_m->get($id);

		// If we have keywords before the update, we'll want to remove them from keywords_applied
		$old_keywords_hash = (trim($post->keywords) != '') ? $post->keywords : null;

		$post->keywords = Keywords::get_string($post->keywords);

		// If we have a useful date, use it
		if ($this->input->post('created_on'))
		{
			$created_on = strtotime(sprintf('%s %s:%s', $this->input->post('created_on'), $this->input->post('created_on_hour'), $this->input->post('created_on_minute')));
		}

		else
		{
			$created_on = $post->created_on;
		}
		
		//xavi
		//create timestamp value from Date:
		if ($this->input->post('start_date'))
		{
			$start_date = strtotime(sprintf('%s', $this->input->post('start_date')));
		}
		else
		{
			$start_date = now();
		}	
		
		if ($this->input->post('end_date'))
		{
			$end_date = strtotime(sprintf('%s', $this->input->post('end_date')));
		}
		else
		{
			$end_date = now();
		}	
		
		
		$this->form_validation->set_rules(array_merge($this->validation_rules, array(
			'title' => array(
				'field' => 'title',
				'label' => 'lang:global:title',
				'rules' => 'trim|htmlspecialchars|required|max_length[100]|callback__check_title['.$id.']'
			),
			'slug' => array(
				'field' => 'slug',
				'label' => 'lang:global:slug',
				'rules' => 'trim|required|alpha_dot_dash|max_length[100]|callback__check_slug['.$id.']'
			),
		)));
        $hash = $this->input->post('preview_hash');

        if ($this->input->post('status') == 'draft' and $this->input->post('preview_hash') == '')
        {

            $hash = $this->_preview_hash();
        }
		
		if ($this->form_validation->run())
		{
			// They are trying to put this live
			if ($post->status != 'live' and $this->input->post('status') == 'live')
			{
				role_or_die('event', 'put_live');
			}

			$author_id = empty($post->display_name) ? $this->current_user->id : $post->author_id;

			$result = $this->event_m->update($id, array(
				'title'				=> $this->input->post('title'),
				'slug'				=> $this->input->post('slug'),
				'category_id'		=> $this->input->post('category_id'),
				'keywords'			=> Keywords::process($this->input->post('keywords'), $old_keywords_hash),
				'intro'				=> $this->input->post('intro'),
				'body'				=> $this->input->post('body'),
				'status'			=> $this->input->post('status'),
				'created_on'		=> $created_on,
				'comments_enabled'	=> $this->input->post('comments_enabled'),
				'author_id'			=> $author_id,
				'type'				=> $this->input->post('type'),
				'parsed'			=> ($this->input->post('type') == 'markdown') ? parse_markdown($this->input->post('body')) : '',
                'preview_hash'      => $hash,
                
   				//added by xavi
				'price'				=> $this->input->post('price'),
				'location'			=> $this->input->post('location'),
				'address'			=> $this->input->post('address'),
				'location'			=> $this->input->post('location'),

                //already added before, need to convert to right format
                //'start_date'		=> $this->input->post('start_date'),
                //'end_date'			=> $this->input->post('end_date'),
                'start_date'		=> $start_date,
                'end_date'			=> $end_date,
				'organizer'			=> $this->input->post('organizer'),
				'price'				=> $this->input->post('price'),
				'link'				=> $this->input->post('link'),
 				'language'			=> $this->input->post('language'),

			));
			
			if ($result)
			{
				$this->session->set_flashdata(array('success' => sprintf(lang('event:edit_success'), $this->input->post('title'))));

				// Event article has been updated, may not be anything to do with publishing though
				Events::trigger('post_updated', $id);

				// They are trying to put this live
				if ($post->status != 'live' and $this->input->post('status') == 'live')
				{
					// Fire an event, we're posting a new event!
					Events::trigger('post_published', $id);
				}
			}
			
			else
			{
				$this->session->set_flashdata('error', lang('event:edit_error'));
			}

			// Redirect back to the form or main page
			$this->input->post('btnAction') == 'save_exit' ? redirect('admin/event') : redirect('admin/event/edit/' . $id);
		}

		// Go through all the known fields and get the post values
		foreach ($this->validation_rules as $key => $field)
		{
			if (isset($_POST[$field['field']]))
			{
				$post->$field['field'] = set_value($field['field']);
			}
		}

		$post->created_on = $created_on;
		$post->end_date = $end_date;
		$post->start_date = $start_date;

		
		$this->template
			->title($this->module_details['name'], sprintf(lang('event:edit_title'), $post->title))
			->append_metadata($this->load->view('fragments/wysiwyg', array(), TRUE))
			->append_js('jquery/jquery.tagsinput.js')
			->append_js('module::event_form.js')
			->append_css('jquery/jquery.tagsinput.css')
			->set('post', $post)
			->build('admin/form');
	}

	/**
	 * Preview event post
	 * 
	 * @param int $id the ID of the event post to preview
	 * @return void
	 */
	public function preview($id = 0)
	{
		$post = $this->event_m->get($id);

		$this->template
				->set_layout('modal', 'admin')
				->set('post', $post)
				->build('admin/preview');
	}

	/**
	 * Helper method to determine what to do with selected items from form post
	 * 
	 * @return void
	 */
	public function action()
	{
		switch ($this->input->post('btnAction'))
		{
			case 'publish':
				$this->publish();
			break;
			
			case 'delete':
				$this->delete();
			break;
			
			default:
				redirect('admin/event');
			break;
		}
	}

	/**
	 * Publish event post
	 * 
	 * @param int $id the ID of the event post to make public
	 * @return void
	 */
	public function publish($id = 0)
	{
		role_or_die('event', 'put_live');

		// Publish one
		$ids = ($id) ? array($id) : $this->input->post('action_to');

		if ( ! empty($ids))
		{
			// Go through the array of slugs to publish
			$post_titles = array();
			foreach ($ids as $id)
			{
				// Get the current page so we can grab the id too
				if ($post = $this->event_m->get($id))
				{
					$this->event_m->publish($id);

					// Wipe cache for this model, the content has changed
					$this->pyrocache->delete('event_m');
					$post_titles[] = $post->title;
				}
			}
		}

		// Some posts have been published
		if ( ! empty($post_titles))
		{
			// Only publishing one post
			if (count($post_titles) == 1)
			{
				$this->session->set_flashdata('success', sprintf($this->lang->line('event:publish_success'), $post_titles[0]));
			}
			// Publishing multiple posts
			else
			{
				$this->session->set_flashdata('success', sprintf($this->lang->line('event:mass_publish_success'), implode('", "', $post_titles)));
			}
		}
		// For some reason, none of them were published
		else
		{
			$this->session->set_flashdata('notice', $this->lang->line('event:publish_error'));
		}

		redirect('admin/event');
	}

	/**
	 * Delete event post
	 * 
	 * @param int $id the ID of the event post to delete
	 * @return void
	 */
	public function delete($id = 0)
	{
		$this->load->model('comments/comments_m');

		role_or_die('event', 'delete_live');

		// Delete one
		$ids = ($id) ? array($id) : $this->input->post('action_to');

		// Go through the array of slugs to delete
		if ( ! empty($ids))
		{
			$post_titles = array();
			$deleted_ids = array();
			foreach ($ids as $id)
			{
				// Get the current page so we can grab the id too
				if ($post = $this->event_m->get($id))
				{
					if ($this->event_m->delete($id))
					{
						$this->comments_m->where('module', 'event')->delete_by('module_id', $id);

						// Wipe cache for this model, the content has changed
						$this->pyrocache->delete('event_m');
						$post_titles[] = $post->title;
						$deleted_ids[] = $id;
					}
				}
			}
			
			// Fire an event. We've deleted one or more event posts.
			Events::trigger('post_deleted', $deleted_ids);
		}

		// Some pages have been deleted
		if ( ! empty($post_titles))
		{
			// Only deleting one page
			if (count($post_titles) == 1)
			{
				$this->session->set_flashdata('success', sprintf($this->lang->line('event:delete_success'), $post_titles[0]));
			}
			// Deleting multiple pages
			else
			{
				$this->session->set_flashdata('success', sprintf($this->lang->line('event:mass_delete_success'), implode('", "', $post_titles)));
			}
		}
		// For some reason, none of them were deleted
		else
		{
			$this->session->set_flashdata('notice', lang('event:delete_error'));
		}

		redirect('admin/event');
	}

	/**
	 * Callback method that checks the title of an post
	 * 
	 * @param string title The Title to check
	 * @return bool
	 */
	public function _check_title($title, $id = null)
	{
		$this->form_validation->set_message('_check_title', sprintf(lang('event:already_exist_error'), lang('global:title')));
		return $this->event_m->check_exists('title', $title, $id);			
	}
	
	/**
	 * Callback method that checks the slug of an post
	 * 
	 * @param string slug The Slug to check
	 * @return bool
	 */
	public function _check_slug($slug, $id = null)
	{
		$this->form_validation->set_message('_check_slug', sprintf(lang('event:already_exist_error'), lang('global:slug')));
		return $this->event_m->check_exists('slug', $slug, $id);
	}

    private function _preview_hash()
    {

        return md5(microtime() + mt_rand(0,1000));

    }
}
