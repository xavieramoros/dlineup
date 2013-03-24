<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Blog module
 *
 * @author PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Blog
 */
class Module_Event	 extends Module {

	public $version = '2.0';

	public function info()
	{
		return array(
			'name' => array(
				'en' => 'Event',
				'es' => 'Evento',

			),
			'description' => array(
				'en' => 'Post event entries.',
				'es' => 'Añadir eventos.',
			),
			'frontend'	=> true,
			'backend'	=> true,
			'skip_xss'	=> true,
			'menu'		=> 'content',

			'roles' => array(
				'put_live', 'edit_live', 'delete_live'
			),

			'sections' => array(
			    'events' => array(  //			    'events' => array(
				    'name' => 'event:posts_title',
				    'uri' => 'admin/event',
				    'shortcuts' => array(
						array(
						   'name' => 'event:create_title',	//'name' => 'event:create_title',
						    'uri' => 'admin/event/create',
						    'class' => 'add'
						),
					),
				),

				'categories' => array(
				    'name' => 'cat_list_title',
				    'uri' => 'admin/event/categories',
				    'shortcuts' => array(
				    	array(
						    'name' => 'cat_create_title',
						    'uri' => 'admin/event/categories/create',
						    'class' => 'add'
						),
				    ),
			    ),
		    ),
		);
	}

	public function install()
	{
		$this->dbforge->drop_table('event_categories');
		$this->dbforge->drop_table('event');

		$tables = array(
			'event_categories' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true, 'key' => true),
				'title' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true),
			),
			'event' => array(
				'id' => array('type' => 'INT', 'constraint' => 11, 'auto_increment' => true, 'primary' => true),
				'title' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false),
				'category_id' => array('type' => 'INT', 'constraint' => 11, 'key' => true),
				'attachment' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => ''),
				'intro' => array('type' => 'TEXT'),
				'body' => array('type' => 'TEXT'),
				'parsed' => array('type' => 'TEXT'),
				'keywords' => array('type' => 'VARCHAR', 'constraint' => 32, 'default' => ''),
				'author_id' => array('type' => 'INT', 'constraint' => 11, 'default' => 0),
				'created_on' => array('type' => 'INT', 'constraint' => 11),
				'updated_on' => array('type' => 'INT', 'constraint' => 11, 'default' => 0),
				'comments_enabled' => array('type' => 'INT', 'constraint' => 1, 'default' => 1),
				'status' => array('type' => 'ENUM', 'constraint' => array('draft', 'live'), 'default' => 'draft'),
				'type' => array('type' => 'SET', 'constraint' => array('html', 'markdown', 'wysiwyg-advanced', 'wysiwyg-simple')),
                'preview_hash' => array('type' => 'CHAR', 'constraint' => 32,'default'=>''),
   				'keywords' => array('type' => 'VARCHAR', 'constraint' => 32, 'default' => ''),

                //added by Xavi.
                'location'=> array('type' => 'VARCHAR', 'constraint' => 40),
                'start_date'=> array('type' => 'INT', 'constraint' => 11),
                'end_date'=> array('type' => 'INT', 'constraint' => 11),
                'address'=> array('type' => 'VARCHAR', 'constraint' => 150),
				'organizer'=> array('type' => 'VARCHAR', 'constraint' => 150),
				'price'=>array('type' => 'VARCHAR', 'constraint' => 30),
				'link'=> array('type' => 'VARCHAR', 'constraint' => 512), 
				'language'=> array('type' => 'VARCHAR', 'constraint' => 30), 
			),
		);

		return $this->install_tables($tables);
	}

	public function uninstall()
	{
		$this->dbforge->drop_table('event_categories');
		$this->dbforge->drop_table('event');
	
		$this->db->delete('settings', array('module' => 'event'));

		return true;
	}

	public function upgrade($old_version)
	{
		return true;
	}
}
