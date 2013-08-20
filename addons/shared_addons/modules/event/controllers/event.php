<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Public Event module controller
 *
 * @author		PyroCMS Dev Team
 * @package 	PyroCMS\Core\Modules\Event\Controllers
 */
class Event extends Public_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('event_m');
		$this->load->model('event_categories_m');
		$this->load->model('comments/comments_m');
		$this->load->library(array('keywords/keywords'));
		$this->lang->load('event');
	}
	
	//FIXME
/*
	public function newsletter(){
	    echo json_encode("Result from newsletter controller");
	}
*/
	/**
	 * Shows the current events: events that will happen 
	 *
	 * event/page/x also routes here
	 */
	 public function index()
	{
		$pagination = create_pagination('event/page', $this->event_m->count_by(array('status' => 'live')), NULL, 3);

		$_event = $this->event_m->limit($pagination['limit'])
			->get_many_by(array('status' => 'live')); 

		// Set meta description based on post titles
		$meta = $this->_posts_metadata($_event);

		foreach ($_event as &$post)
		{
			$post->keywords = Keywords::get($post->keywords);
			$post->url = site_url('event/'.date('Y', $post->created_on).'/'.date('m', $post->created_on).'/'.$post->slug);
		}

		$this->template
			->title("Homepage")
			->set_breadcrumb(lang('event:event_title'))
			->set_metadata('description', "Dlineup is an agenda with curated events, related to design, innovation and technology. We carefully select interesting events in Barcelona for you.")
			->set_metadata('title', "Design, innovation and technology events in Barcelona")
			->set_metadata('keywords', "kw1, kw2")
			->set('pagination', $pagination)
			->set('event', $_event)
			->build('posts');
	}

	/**
	 * Shows the about page	 
	 */
	 public function about()
	{
		//$this->load->view('about');
		// Set meta description based on post titles
		$meta = $this->_posts_metadata($_event);

		$this->template
			->title("About")
			->set_breadcrumb(lang('event:event_title'))
			->set_metadata('description', " Dlineup is an agenda with events related to design, innovation and technology. We carefully select interesting events in Barcelona for you.")
			->set_metadata('title', "About")
			->set_metadata('keywords', "about, barcelona, dlineup, events")
			->set_layout('content.html')
			->build('about');
	}

	/**
	 * Shows the about page	 
	 */
	 public function terms()
	{
		//$this->load->view('about');
		// Set meta description based on post titles
		$meta = $this->_posts_metadata($_event);

		$this->template
			->title("Terms and Conditions")
			->set_breadcrumb(lang('event:event_title'))
			->set_metadata('description', "Terms and conditions of use of Dlineup and it's newsletter. Dlineup is an online agenda with design, innovation and technology events in Barcelona.")
			->set_metadata('title', "Terms and Conditions")
			->set_metadata('keywords', "barcelona, conditions, dlineup, events, newsletter, privacy, terms")
			->set_layout('content.html')
			->build('terms');
	}

	/**
	 * Shows the error page	 
	 */
	 public function error()
	{
		//$this->load->view('about');
		// Set meta description based on post titles
		$meta = $this->_posts_metadata($_event);

		$this->template
			->title("Page not found")
			->set_breadcrumb(lang('event:event_title'))
			->set_metadata('description', "Sorry, that page doesnÕt exist! Thanks for noticingÑwe're going to fix it up and have things back to normal soon. ")
			->set_metadata('title', "Error, page doesn't exist")
			->set_metadata('keywords', "barcelona, error, dlineup, events")
			->build('error');
	}

	/**
	 * Lists the posts in a specific category.
	 *
	 * @param string $slug The slug of the category.
	 */
	public function category($slug = '')
	{
		$slug OR redirect('event');

		// Get category data
		$category = $this->event_categories_m->get_by('slug', $slug) OR show_404();

		// Count total event posts and work out how many pages exist
		$pagination = create_pagination('event/category/'.$slug, $this->event_m->count_by(array(
			'category' => $slug,
			'status' => 'live'
		)), NULL, 4);

		// Get the current page of event posts
		
		$event = $this->event_m->limit($pagination['limit'])->get_many_by(array(
			'category' => $slug,
			'status' => 'live'
		));

		// Set meta description based on post titles
		$meta = $this->_posts_metadata($event);

		foreach ($event AS &$post)
		{
			$post->keywords = Keywords::get($post->keywords);
			$post->url = site_url('event/'.date('Y', $post->created_on).'/'.date('m', $post->created_on).'/'.$post->slug);
		}

		// Build the page
		$this->template->title($this->module_details['name'], $category->title)
			->set_metadata('description', $category->title.'. '.$meta['description'])
			->set_metadata('keywords', $category->title)
			->set_breadcrumb(lang('event:event_title'), 'event')
			->set_breadcrumb($category->title)
			->set('event', $event)
			->set('category', $category)
			->set('pagination', $pagination)
			->build('posts');
	}

	/**
	 * Lists the posts in a specific year/month.
	 *
	 * @param null|string $year The year to show the posts for.
	 * @param string $month The month to show the posts for.
	 */
	public function archive($year = NULL, $month = '01')
	{
		$year OR $year = date('Y');
		$month_date = new DateTime($year.'-'.$month.'-01');
		$pagination = create_pagination('event/archive/'.$year.'/'.$month, $this->event_m->count_by(array('year' => $year, 'month' => $month)), NULL, 5);
		$_event = $this->event_m
			->limit($pagination['limit'])
			->get_many_by(array('year' => $year, 'month' => $month));
		$month_year = format_date($month_date->format('U'), lang('event:archive_date_format'));

		// Set meta description based on post titles
		$meta = $this->_posts_metadata($_event);

		foreach ($_event AS &$post)
		{
			$post->keywords = Keywords::get($post->keywords, 'event/tagged');
			$post->url = site_url('event/'.date('Y', $post->created_on).'/'.date('m', $post->created_on).'/'.$post->slug);
		}

		$this->template
			->title($month_year, $this->lang->line('event:archive_title'), lang('event:event_title'))
			->set_metadata('description', $month_year.'. '.$meta['description'])
			->set_metadata('keywords', $month_year.', '.$meta['keywords'])
			->set_breadcrumb(lang('event:event_title'), 'event')
			->set_breadcrumb(lang('event:archive_title').': '.format_date($month_date->format('U'), lang('event:archive_date_format')))
			->set('pagination', $pagination)
			->set('event', $_event)
			->set('month_year', $month_year)
			->build('archive');
	}

	/**
	 * View a post
	 *
	 * @param string $slug The slug of the event post.
	 */
	public function view($slug = '')
	{
		if ( ! $slug or ! $post = $this->event_m->get_by('slug', $slug))
		{
			redirect('event');
		}

		if ($post->status != 'live' && ! $this->ion_auth->is_admin())
		{
			redirect('event');
		}

		$this->_single_view($post);

	}

    /**
     * preview a post
     *
     * @param string $hash the preview_hash of post
     */
    public function preview($hash = '')
    {
        if ( ! $hash or ! $post = $this->event_m->get_by('preview_hash', $hash))
        {
            redirect('event');
        }

        if ($post->status == 'live')
        {
            redirect('event/' . date('Y/m',$post->created_on) . '/' . $post->slug);
        }

        //set index nofollow to attempt to avoid search engine indexing
        $this->template
            ->set_metadata('index','nofollow');

        $this->_single_view($post);

    }
	/**
	 * @todo Document this.
	 *
	 * @param string $tag
	 */
	public function tagged($tag = '')
	{
		// decode encoded cyrillic characters
		$tag = rawurldecode($tag) OR redirect('event');

		// Count total event posts and work out how many pages exist
		$pagination = create_pagination('event/tagged/'.$tag, $this->event_m->count_tagged_by($tag, array('status' => 'live')), NULL, 4);

		// Get the current page of event posts
		$event = $this->event_m
			->limit($pagination['limit'])
			->get_tagged_by($tag, array('status' => 'live'));

		foreach ($event AS &$post)
		{
			$post->keywords = Keywords::get($post->keywords, 'event/tagged');
			$post->url = site_url('event/'.date('Y', $post->created_on).'/'.date('m', $post->created_on).'/'.$post->slug);
		}

		// Set meta description based on post titles
		$meta = $this->_posts_metadata($event);

		$name = str_replace('-', ' ', $tag);

		// Build the page
		$this->template
			->title($this->module_details['name'], lang('event:tagged_label').': '.$name)
			->set_metadata('description', lang('event:tagged_label').': '.$name.'. '.$meta['description'])
			->set_metadata('keywords', $name)
			->set_breadcrumb(lang('event:event_title'), 'event')
			->set_breadcrumb(lang('event:tagged_label').': '.$name)
			->set('event', $event)
			->set('tag', $tag)
			->set('pagination', $pagination)
			->build('posts');
	}

	/**
	 * @todo Document this.
	 *
	 * @param array $posts
	 *
	 * @return array
	 */
	private function _posts_metadata(&$posts = array())
	{
		$keywords = array();
		$description = array();

		// Loop through posts and use titles for meta description
		if ( ! empty($posts))
		{
			foreach ($posts as &$post)
			{
				if ($post->category_title)
				{
					$keywords[$post->category_id] = $post->category_title.', '.$post->category_slug;
				}
				$description[] = $post->title;
			}
		}

		return array(
			'keywords' => implode(', ', $keywords),
			'description' => implode(', ', $description)
		);
	}

    private function _single_view($post,$build='view')
    {

        // if it uses markdown then display the parsed version
        if ($post->type == 'markdown')
        {
            $post->body = $post->parsed;
        }

        // IF this post uses a category, grab it
        if ($post->category_id && ($category = $this->event_categories_m->get($post->category_id)))
        {
            $post->category = $category;
        }

        // Set some defaults
        else
        {
            $post->category = (object) array(
            	'id' => 0,
				'slug' => '',
				'title' => '',
			);
        }

        $this->session->set_flashdata(array('referrer' => $this->uri->uri_string));

        $this->template->title($post->title, lang('event:event_title'))
            //->set_metadata('description', $post->intro)
            ->set_metadata('keywords', implode(', ', Keywords::get_array($post->keywords)))
            ->set_breadcrumb(lang('event:event_title'), 'event');

        if ($post->category->id > 0)
        {
            $this->template->set_breadcrumb($post->category->title, 'event/category/'.$post->category->slug);
        }

        $post->keywords = Keywords::get($post->keywords);

        $this->template
            ->set_breadcrumb($post->title)
            ->set('post', $post)
            ->build($build);
    }
}
