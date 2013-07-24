<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Event_m extends MY_Model
{
	protected $_table = 'event';

	public function get_all()
	{
		$this->db
			->select('event.*, event_categories.title AS category_title, event_categories.slug AS category_slug, profiles.display_name')
			->join('event_categories', 'event.category_id = event_categories.id', 'left')
			->join('profiles', 'profiles.user_id = event.author_id', 'left')
			->order_by('created_on', 'DESC');

		return $this->db->get('event')->result();
	}

	public function get_all_live()
	{
		$this->db
			->select('event.*, event_categories.title AS category_title, event_categories.slug AS category_slug, profiles.display_name')
			->join('event_categories', 'event.category_id = event_categories.id', 'left')
			->join('profiles', 'profiles.user_id = event.author_id', 'left')
			->order_by('created_on', 'DESC');

		return $this->db->get('event')->result();
	}

	public function get($id)
	{
		return $this->db
			->select('event.*, profiles.display_name')
			->join('profiles', 'profiles.user_id = event.author_id', 'left')
			->where(array('event.id' => $id))
			->get('event')
			->row();
	}
	
	public function eventExists($gid){
		//function that returns 1 if event already in database, 0 if not. Using the unique gcalid.
		$this->db->where('event.id',$gid)
			 ->limit(1);
		$result = $this->db->count_all_results('event');
		
		if ($result!=0){
			return true;
		}else{
			return false;
		}
			
	}
		
	public function get_by($key, $value = '')
	{
		$this->db
			->select('event.*, profiles.display_name')
			->join('profiles', 'profiles.user_id = event.author_id', 'left');
			
		if (is_array($key))
		{
			$this->db->where($key);
		}
		else
		{
			$this->db->where($key, $value);
		}

		return $this->db->get($this->_table)->row();
	}

	public function get_many_by($params = array())
	{
		$this->load->helper('date');

		if (!empty($params['category']))
		{
			if (is_numeric($params['category']))
				$this->db->where('event_categories.id', $params['category']);
			else
				$this->db->where('event_categories.slug', $params['category']);
		}

		if (!empty($params['day']))
		{
			$this->db->where('DAY(FROM_UNIXTIME(start_date)) >=', $params['day']);
		}

		if (!empty($params['month']))
		{
			$this->db->where('MONTH(FROM_UNIXTIME(start_date)) >=', $params['month']);
		}

		if (!empty($params['year']))
		{
			$this->db->where('YEAR(FROM_UNIXTIME(start_date)) >=', $params['year']);
		}

		if ( ! empty($params['keywords']))
		{
			$this->db
				->like('event.title', trim($params['keywords']))
				->or_like('profiles.display_name', trim($params['keywords']));
		}

		//show only events with start_date higher than current date. 
		$this->db->where('start_date >=', now());

		// Is a status set?
		if (!empty($params['status']))
		{
			// If it's all, then show whatever the status
			if ($params['status'] != 'all')
			{
				// Otherwise, show only the specific status
				$this->db->where('status', $params['status']);
			}
		}
		// Nothing mentioned, show live only (general frontend stuff)
		else
		{
			$this->db->where('status', 'live');
		}


		// Limit the results based on 1 number or 2 (2nd is offset)
		if (isset($params['limit']) && is_array($params['limit']))
			$this->db->limit($params['limit'][0], $params['limit'][1]);
		elseif (isset($params['limit']))
			$this->db->limit($params['limit']);
		
		
		//order results from newer to older	
		$this->db->order_by("start_date", "asc");	
		

		$final_result = $this->get_all();
/* 		echo $this->db->last_query(); */
		return $final_result;
//		return $this->get_all();

	}
	
	public function count_tagged_by($tag, $params)
	{
		return $this->select('*')
			->from('event')
			->join('keywords_applied', 'keywords_applied.hash = event.keywords')
			->join('keywords', 'keywords.id = keywords_applied.keyword_id')
			->where('keywords.name', str_replace('-', ' ', $tag))
			->where($params)
			->count_all_results();
	}
	
	public function get_tagged_by($tag, $params)
	{
		return $this->db->select('event.*, event.title title, event.slug slug, event_categories.title category_title, event_categories.slug category_slug, profiles.display_name')
			->from('event')
			->join('keywords_applied', 'keywords_applied.hash = event.keywords')
			->join('keywords', 'keywords.id = keywords_applied.keyword_id')
			->join('event_categories', 'event_categories.id = event.category_id', 'left')
			->join('profiles', 'profiles.user_id = event.author_id', 'left')
			->where('keywords.name', str_replace('-', ' ', $tag))
			->where($params)
			->get()
			->result();
	}

	public function count_by($params = array())
	{
		$this->db->join('event_categories', 'event.category_id = event_categories.id', 'left')
			// we need the display name joined so we can get an accurate count when searching
			->join('profiles', 'profiles.user_id = event.author_id');

		if (!empty($params['category']))
		{
			if (is_numeric($params['category']))
				$this->db->where('event_categories.id', $params['category']);
			else
				$this->db->where('event_categories.slug', $params['category']);
		}
		//added by Xavi.
		
		if (!empty($params['day']))
		{
			$this->db->where('DAY(FROM_UNIXTIME(start_date))', $params['day']);
		}
		//end of Added by Xavi.
		
		
		if (!empty($params['month']))
		{
			$query=$this->db->where('MONTH(FROM_UNIXTIME(start_date))', $params['month']);
		}

		if (!empty($params['year']))
		{
			$this->db->where('YEAR(FROM_UNIXTIME(start_date))', $params['year']);
		}

		if ( ! empty($params['keywords']))
		{
			$this->db
				->like('event.title', trim($params['keywords']))
				->or_like('profiles.display_name', trim($params['keywords']));
		}

		// Is a status set?
		if (!empty($params['status']))
		{
			// If it's all, then show whatever the status
			if ($params['status'] != 'all')
			{
				// Otherwise, show only the specific status
				$this->db->where('status', $params['status']);
			}
		}

		// Nothing mentioned, show live only (general frontend stuff)
		else
		{
			$this->db->where('status', 'live');
		}
		

		return $this->db->count_all_results('event');
	}

	public function get_last_event_date(){
		//Function that gets the month and year of the event more far in the future. 
		//returns timestamp of the event start_date or current timestamp if no events are found
		
		
		$this->db->select('start_date')
				 ->from('default_event')
				 ->where('start_date > UNIX_TIMESTAMP(now())')
				 ->where('status','live')
/* 				 ->where('author_id !=', 0)				  */				 
				 ->order_by("start_date", "DESC")
				 ->limit(1);
		
		$result = $this->db->get()->result_array();
		
/* 		echo $this->db->last_query(); */

		$last_event_date=time();
		
		if(!is_null($result)){
			if(is_array($result)){
				if(!empty($result)){
					$last_event_date=reset($result[0]);
				}
			}
		}
		
		return $last_event_date; 
	}

	public function update($id, $input)
	{
		$input['updated_on'] = now();
        if($input['status'] == "live" and $input['preview_hash'] !='') $input['preview_hash'] = '';
		return parent::update($id, $input);
	}

	public function publish($id = 0)
	{
		return parent::update($id, array('status' => 'live','preview_hash'=>''));
	}

	// -- Archive ---------------------------------------------

	public function get_archive_months()
	{
		$this->db->select('UNIX_TIMESTAMP(DATE_FORMAT(FROM_UNIXTIME(t1.created_on), "%Y-%m-02")) AS `date`', FALSE);
		$this->db->from('event t1');
		$this->db->distinct();
		$this->db->select('(SELECT count(id) FROM ' . $this->db->dbprefix('event') . ' t2
							WHERE MONTH(FROM_UNIXTIME(t1.created_on)) = MONTH(FROM_UNIXTIME(t2.created_on))
								AND YEAR(FROM_UNIXTIME(t1.created_on)) = YEAR(FROM_UNIXTIME(t2.created_on))
								AND status = "live"
								AND created_on <= ' . now() . '
						   ) as post_count');

		$this->db->where('status', 'live');
		$this->db->where('created_on <=', now());
		$this->db->having('post_count >', 0);
		$this->db->order_by('t1.created_on DESC');
		$query = $this->db->get();

		return $query->result();
	}

	// DIRTY frontend functions. Move to views
	public function get_event_fragment($params = array())
	{
		$this->load->helper('date');

		$this->db->where('status', 'live');
		$this->db->where('created_on <=', now());

		$string = '';
		$this->db->order_by('created_on', 'DESC');
		$this->db->limit(5);
		$query = $this->db->get('event');
		if ($query->num_rows() > 0)
		{
			$this->load->helper('text');
			foreach ($query->result() as $event)
			{
				$string .= '<p>' . anchor('event/' . date('Y/m') . '/' . $event->slug, $event->title) . '<br />' . strip_tags($event->intro) . '</p>';
			}
		}
		return $string;
	}

	public function check_exists($field, $value = '', $id = 0)
	{
		if (is_array($field))
		{
			$params = $field;
			$id = $value;
		}
		else
		{
			$params[$field] = $value;
		}
		$params['id !='] = (int) $id;

		return parent::count_by($params) == 0;
	}

	/**
	 * Searches event posts based on supplied data array
	 * @param $data array
	 * @return array
	 */
	public function search($data = array())
	{
		if (array_key_exists('category_id', $data))
		{
			$this->db->where('category_id', $data['category_id']);
		}

		if (array_key_exists('status', $data))
		{
			$this->db->where('status', $data['status']);
		}

		if (array_key_exists('keywords', $data))
		{
			$matches = array();
			if (strstr($data['keywords'], '%'))
			{
				preg_match_all('/%.*?%/i', $data['keywords'], $matches);
			}

			if (!empty($matches[0]))
			{
				foreach ($matches[0] as $match)
				{
					$phrases[] = str_replace('%', '', $match);
				}
			}
			else
			{
				$temp_phrases = explode(' ', $data['keywords']);
				foreach ($temp_phrases as $phrase)
				{
					$phrases[] = str_replace('%', '', $phrase);
				}
			}

			$counter = 0;
			foreach ($phrases as $phrase)
			{
				if ($counter == 0)
				{
					$this->db->like('event.title', $phrase);
				}
				else
				{
					$this->db->or_like('event.title', $phrase);
				}

				$this->db->or_like('event.body', $phrase);
				//$this->db->or_like('event.intro', $phrase);
				$this->db->or_like('profiles.display_name', $phrase);
				$counter++;
			}
		}
		return $this();
	}

}