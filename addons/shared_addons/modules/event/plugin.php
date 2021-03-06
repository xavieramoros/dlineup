<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * event Plugin
 *
 * Create lists of events
 * 
 * @author		PyroCMS Dev Team
 * @package		PyroCMS\Core\Modules\event\Plugins
 */
class Plugin_Event extends Plugin
{
	/**
	 * event List
	 *
	 * Creates a list of event posts
	 *
	 * Usage:
	 * {{ event:posts order-by="title" limit="5" }}
	 *		<h2>{{ title }}</h2>
	 *		<p> {{ body }} </p>
	 * {{ /event:posts }}
	 *
	 * @param	array
	 * @return	array
	 */
	public function posts()
	{
		$limit		= $this->attribute('limit', 10);
		$offset		= $this->attribute('offset',0);
		$category	= $this->attribute('category');
		$order_by 	= $this->attribute('order-by', 'created_on');
		$order_dir	= $this->attribute('order-dir', 'ASC');

		if ($category)
		{
			$categories = explode('|', $category);
			$category = array_shift($categories);

			$this->db->where('event_categories.' . (is_numeric($category) ? 'id' : 'slug'), $category);

			foreach($categories as $category)
			{
				$this->db->or_where('event_categories.' . (is_numeric($category) ? 'id' : 'slug'), $category);
			}
		}

		$posts = $this->db
			->select('event.*')
			->select('event_categories.title as category_title, event_categories.slug as category_slug')
			->select('p.display_name as author_name')
			->where('status', 'live')
			->where('	 <=', now())
			->join('event_categories', 'event.category_id = event_categories.id', 'left')
			->join('profiles p', 'event.author_id = p.user_id', 'left')
			->order_by('event.' . $order_by, $order_dir)
			->limit($limit,$offset)
			->get('event')
			->result();
		$i = 1;
		foreach ($posts as &$post)
		{
			$post->url = site_url('event/'.date('Y', $post->created_on).'/'.date('m', $post->created_on).'/'.$post->slug);
			$post->count = $i++;
		}
		
		return $posts;
	}

	/**
	 * Categories
	 *
	 * Creates a list of event categories
	 *
	 * Usage:
	 * {{ event:categories order-by="title" limit="5" }}
	 *		<a href="{{ url }}" class="{{ slug }}">{{ title }}</a>
	 * {{ /event:categories }}
	 *
	 * @param	array
	 * @return	array
	 */
	public function categories()
	{
		$limit		= $this->attribute('limit', 10);
		$order_by 	= $this->attribute('order-by', 'title');
		$order_dir	= $this->attribute('order-dir', 'ASC');

		$categories = $this->db
			->select('title, slug')
			->order_by($order_by, $order_dir)
			->limit($limit)
			->get('event_categories')
			->result();

		foreach ($categories as &$category)
		{
			$category->url = site_url('event/category/'.$category->slug);
		}
		
		return $categories;
	}

	/**
	 * Count Posts By Column
	 *
	 * Usage:
	 * {{ event:count_posts author_id="1" }}
	 *
	 * The attribute name is the database column and 
	 * the attribute value is the where value
	 */
	public function count_posts()
	{
		$wheres = $this->attributes();

		// make sure they provided a where clause
		if (count($wheres) == 0) return FALSE;

		foreach ($wheres AS $column => $value)
		{
			$this->db->where($column, $value);
		}

		return $this->db->count_all_results('event');
	}
		/**
	 * Dates
	 *
	 * Creates a list of dates of the events, starting for the current month until the month of the last event
	 *
	 * Usage:
	 * {{ event:categories order-by="title" limit="5" }}
	 *		<a href="{{ url }}" class="{{ slug }}">{{ title }}</a>
	 * {{ /event:categories }}
	 *
	 * @param	array
	 * @return	array
	 */
	 
	public function dates()
	{
		$current_month = date("M");
	
		$limit		= $this->attribute('limit', 10);
		$order_by 	= $this->attribute('order-by', 'title');
		$order_dir	= $this->attribute('order-dir', 'ASC');
		/*
		$dates = $this->db
			->select('title, slug')
			->order_by($order_by, $order_dir)
			->limit($limit)
			->get('event_categories')
			->result();
			*/
		/*foreach ($dates as &$date)
		{
			$date->url = site_url('event/category/'.$category->slug);
		}*/
		
		$result=array(
			"url" => "bar_url",
			"slug" => "bar_slug",
			"title"=> "bar_title"
		);
		return $result;
	}
	/*
	 *	Function that returns list of months (and years if needed) between current date and last event in database.
	 *	Years are shown only if we have months of two different years		
	 * Usage:
	 *		{{ event:months_until_last_event }}
	 *		{{ /event:months_until_last_event }}
	 *
	 * @param	array
	 * @return	<ul></ul>
	 */
	public function months_until_last_event(){
	
		//we now current month:
		$current_month = date("M");
		$current_year = date("Y");
		$current_timestamp=time();	
		
		$last_event_timestamp = $this->event_m->get_last_event_date();

	    $begin = new DateTime();
	    $begin->setTimestamp($current_timestamp);// $start_date );
	    
	    $end = new DateTime();
	    $end->setTimestamp($last_event_timestamp);
	    
	    //$end->modify('+1 month'); //add one month to see last one correctly
	    
	    $interval = new DateInterval('P1M'); // 1 month interval
	
	    $period = new DatePeriod($begin, $interval, $end);
	
	    $array_full=array();

	    foreach ( $period as $dt	 ){
	    	$array_months[]=$dt->format( "F" );						//array of months
	    	$array_months_numbers[]=$dt->format( "n" );				//array of months numbers, 1, 2,3...
	    	$arra_years[]=$dt->format( "Y" ); 						//array of years
	        $array_full[$dt->format( "Y" )][] = $dt->format( "F" ); //array compelte: array(2013 => array("May","June","July","August"), 2014=> ....)

	    }	    
	    
	    /*
	    $arra_years = Array ( [0] => 2013 
	    		[1] => 2013 
	    		[2] => 2013 
	    		[3] => 2013 
	    		[4] => 2013 
	    		[5] => 2013 
	    		[6] => 2014 
	    		[7] => 2014 
	    		[8] => 2014 ) 

	    $array_months = Array ( [0] => July 
	    		[1] => August 
	    		[2] => September 
	    		[3] => October 
	    		[4] => November 
	    		[5] => December 
	    		[6] => January 
	    		[7] => February 
	    		[8] => March ) 

	    $array_full =Array ( [2013] => Array ( 
	    				[0] => July 
	    				[1] => August 
	    				[2] => September 
	    				[3] => October 
	    				[4] => November 
	    				[5] => December ) 
	    		[2014] => Array ( 
	    				[0] => January 
	    				[1] => February 
	    				[2] => March ) ) 
	    */
	    $final_result="<ul id='event_left_menu_months'>";
	    if (sizeof($array_full)==1){ //we only have one year, we only show months
		    foreach($array_months as $key=>$month){
			    $final_result.="<li>";
			    //check if there are events for a specific month
			    if ($this->event_m->events_in_month($array_months_numbers[$key],$arra_years[$key])==1){
			    	//add link to month if there are events in that month
				    $final_result.="<a href='#".$month."_".$arra_years[$key]."'>";
				    $final_result.=$month;
				    $final_result.="</a>";
				}else{
					$final_result.=$month;
				}
			    $final_result.="</li>";
		    }
	    }
	    else if(sizeof($array_full)>1){  //we have multiple years, print year and then months 
		    foreach($array_full as $key=>$year){
				$final_result.="<li>";
				$final_result.=$key;
				$final_result.="</li>";
				
			    foreach($array_full[$key] as $key=>$month){
				    $final_result.="<li>";
				    $final_result.=$month;
				    $final_result.="</li>";
			    }
			    
			}
	    }else{  //$array_full is empty, so use current month
			/* in case we need to show current month even if there are not events
			$final_result.="<li>";
			$final_result.=date("M");
			$final_result.="</li>";
			*/
		}

	    $final_result.="</ul>";
	    return $final_result;
	}

}

/* End of file plugin.php */