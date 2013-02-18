<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * event Plugin
 *
 * Create lists of posts
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
			->where('created_on <=', now())
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
}

/* End of file plugin.php */