<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Show Latest event in your site with a widget. 
 * 
 * Intended for use on cms pages. Usage : 
 * on a CMS page add:
 * 
 * 		{widget_area('name_of_area')} 
 * 
 * 'name_of_area' is the name of the widget area you created in the  admin 
 * control panel
 * 
 * @author		Erik Berman
 * @author		PyroCMS Dev Team
 * @package		PyroCMS\Core\Modules\Blog\Widgets
 */
class Widget_Latest_posts extends Widgets
{

        public $title = array(
            'en'         => 'Latest posts',
            'br'         => 'Artigos recentes do Blog',
            'pt'         => 'Artigos recentes do Blog',
            'el'         => 'Τελευταίες αναρτήσεις ιστολογίου',
            'fr'         => 'Derniers articles',
            'ru'         => 'Последние записи',
            'id'         => 'Post Terbaru',
        );
        public $description = array(
            'en'     => 'Display latest event posts with a widget',
            'br'     => 'Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog',
            'pt'     => 'Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog',
            'el'     => 'Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας',
            'fr'     => 'Permet d\'afficher la liste des derniers posts du event dans un Widget',
            'ru'     => 'Выводит список последних записей блога внутри виджета',
            'id'     => 'Menampilkan posting event terbaru menggunakan widget',
        );
        public $author  = 'Erik Berman';
        public $website = 'http://www.nukleo.fr';
        public $version = '1.0';
        // build form fields for the backend
        // MUST match the field name declared in the form.php file
        public $fields = array(
            array(
                'field' => 'limit',
                'label' => 'Number of posts',
            )
        );

        public function form($options)
        {
                !empty($options['limit']) OR $options['limit'] = 5;

                return array(
                    'options' => $options
                );
        }

        public function run($options)
        {
                // load the event module's model
                class_exists('Blog_m') OR $this->load->model('event/event_m');

                // sets default number of posts to be shown
                empty($options['limit']) AND $options['limit'] = 5;

                // retrieve the records using the event module's model
                $event_widget = $this->event_m->limit($options['limit'])->get_many_by(array('status' => 'live'));

                // returns the variables to be used within the widget's view
                return array('event_widget' => $event_widget);
        }

}
