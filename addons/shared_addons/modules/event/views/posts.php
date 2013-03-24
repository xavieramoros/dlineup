<?php if (isset($category->title)): ?>
	<h2 id="page_title"><?php echo $category->title; ?></h2>

<?php elseif (isset($tag)): ?>
	<h2 id="page_title"><?php echo lang('event:tagged_label').': '.$tag; ?></h2>

<?php endif; ?>

<?php if ( ! empty($event)): ?>

<?php foreach ($event as $post): ?>
	<div class="post event">
		<!-- Post heading -->
		<div class="date event_date">
<!-- 			<?php echo lang('event:posted_label');?>:  -->
			<span><?php echo format_date($post->start_date, 'd.m'); ?></span>
		</div>
		
		<div class="event_title">
			<!--<h3><?php echo  anchor('event/'.date('Y/m/', $post->created_on).$post->slug, $post->title); ?></h3>-->
			<h3><a href="<?php echo($post->link)?>"><?php echo($post->title);?></a>
		</div>
		
		<div class="meta">
			<?php if ($post->category_slug): ?>
			<div class="category">
				<?php echo lang('event:category_label');?>: 
				<span><?php echo anchor('event/category/'.$post->category_slug, $post->category_title);?></span>
			</div>
			<?php endif; ?>
			<?php if ($post->keywords): ?>
			<div class="keywords">
				<?php echo lang('event:tagged_label');?>:
				<?php foreach ($post->keywords as $keyword): ?>
					<span><?php echo anchor('event/tagged/'.$keyword->name, $keyword->name, 'class="keyword"') ?></span>
				<?php endforeach; ?>
			</div>
			<?php endif; ?>
		</div>
		
		<div class="info-tags-box">
		
			<?php if ($post->location){
				echo '<div class="info-tag" id="info-tag-location">';
				echo lang('event:location').": ";
				echo $post->location;
				echo '</div>';
			} ?>
			
			<?php if ($post->language){
				echo '<div class="info-tag" id="info-tag-language">';
				echo lang('event:event_language').": ";
				echo $post->language;
				echo '</div>';
			} ?>

			<?php if ($post->price){
				echo '<div class="info-tag" id="info-tag-price">';
				echo lang('event:price').": ";
				echo $post->price;
				echo '</div>';
			} ?>

			<?php if ($post->organizer){
				echo '<div class="info-tag" id="info-tag-organizer">';
				echo lang('event:organizer').": ";
				echo $post->organizer;
				echo '</div>';
			} ?>

			<?php if ($post->address){
				echo '<div class="info-tag" id="info-tag-address">';
				echo lang('event:address').": ";
				echo $post->address;
				echo '</div>';
			} ?>
		</div>

		<div class="intro">
			<?php echo $post->intro; ?>
		</div>
	</div>
<?php endforeach; ?>

<?php echo $pagination['links']; ?>

<?php else: ?>
	<p><?php echo lang('event:currently_no_posts');?></p>
<?php endif; ?>