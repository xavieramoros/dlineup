<ul class="navigation">
	<?php foreach($event_widget as $post_widget): ?>
		<li><?php echo anchor('event/'.date('Y/m', $post_widget->created_on) .'/'.$post_widget->slug, $post_widget->title); ?></li>
	<?php endforeach; ?>
</ul>