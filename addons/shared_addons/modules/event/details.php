<?php defined('BASEPATH') or exit('No direct script access allowed');

/**
 * Blog module
 *
 * @author PyroCMS Dev Team
 * @package PyroCMS\Core\Modules\Blog
 */
class Module_Event extends Module {

	public $version = '2.4';

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
						array(
						   'name' => 'event:load_gcal',	//'name' => 'event:create_title',
						    'uri' => 'admin/event/load',
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
				'id' => array('type' => 'VARCHAR', 'constraint' => 26, 'unique' => true, 'primary'=>true),
				'title' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false, 'unique' => true),
				'slug' => array('type' => 'VARCHAR', 'constraint' => 100, 'null' => false),
				'category_id' => array('type' => 'INT', 'constraint' => 11, 'key' => true),
				'attachment' => array('type' => 'VARCHAR', 'constraint' => 255, 'default' => ''),
				//'intro' => array('type' => 'TEXT'),
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
                'address'=> array('type' => 'VARCHAR', 'constraint' => 150,'default' => ''),
				'organizer'=> array('type' => 'VARCHAR', 'constraint' => 150,'default' => ''),
				'organizer_link'=> array('type' => 'VARCHAR', 'constraint' => 512,'default' => ''), 
				'price'=>array('type' => 'VARCHAR', 'constraint' => 30,'default' => ''),
				'event_link'=> array('type' => 'VARCHAR', 'constraint' => 512,'default' => ''), 
				'language'=> array('type' => 'VARCHAR', 'constraint' => 30,'default' => ''), 
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
		switch ($old_version) {
			case '2.2':
				//add here all the modifications in the database
				//http://ellislab.com/codeigniter/user-guide/database/forge.html
				
				$fields = array(
/*                         'start_date' => array('default' => ''), */
/*                         'address' => array('default' => '')                         */
                        'start_date' => array(
		                        'name' => 'start_date',
		                        'type' => 'int(11)',
                        		'default' => 1577840461),
                        'end_date' => array(
		                        'name' => 'end_date',
		                        'type' => 'int(11)',
                        		'default' => 1577840461),
                        'slug' => array(
                        	'type' => 'VARCHAR',
                        	'constraint' => 100,
                        	'null' => false,                        	                        	
                        	'default' => ''),
                        'location' => array(
		                        'name' => 'location',
		                        'type' => 'varchar(40)',
                        		'default' => ''),
                        	
                );
				$this->dbforge->modify_column('event', $fields);
				break;
			case '2.3':  //make title not unique.
				$fields = array(
					'title' => array(
						'type' => 'VARCHAR(100)', 
						'null' => false, 
						'unique' => false),
				);	
				$this->dbforge->modify_column('event', $fields);
			break;
					
		}
		return true;
	}
}
