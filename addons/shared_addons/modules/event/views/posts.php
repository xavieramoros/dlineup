<?php if (isset($category->title)): ?>
	<h2 id="page_title"><?php echo $category->title; ?></h2>

<?php elseif (isset($tag)): ?>
	<h2 id="page_title"><?php echo lang('event:tagged_label').': '.$tag; ?></h2>

<?php endif; ?>

<?php if ( ! empty($event)): ?>

<?php foreach ($event as $post): ?>
	<div class="event_post">
		<!-- Post heading -->
		<div class="event_header">
			<div class="event_date">
	<!-- 			<?php echo lang('event:posted_label');?>:  -->
				<?php echo format_date($post->start_date, 'd/m'); ?>
			</div>
			
			<div class="event_title">
				<!--<h3><?php echo  anchor('event/'.date('Y/m/', $post->created_on).$post->slug, $post->title); ?></h3>-->
				<h3><a href="<?php echo($post->event_link)?>" target="_blank"><?php echo($post->title);?></a>
			</div>
		</div>
		<div class="event_meta">
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
		<div class="event_body">
			<div class="event_info">
				<ul class="event_info_list">
					<li class="info-tag" id="info-tag-time">
						19:00-21:00
					</li>	
					<?php if ($post->location){
	
						echo '<li class="info-tag" id="info-tag-location">';
						echo lang('event:location_post')." ";
						echo '<span style="font-weight:bold;">';
						echo $post->location;
						echo '</span>';					
						if (($post->address) || ($post->organizer) || ($post->language) || ($post->price) || ($post->address)){ 
							echo ",";
						}		
	
						echo '</li>';
					} ?>
					
					<?php if ($post->address){
						echo '<li class="info-tag" id="info-tag-address">';
						echo '<span style="font-weight:bold;">';					
						echo $post->address;
						echo '</span>';										
						echo '</li>';
					} ?>
				</ul>
				<ul class="event_info_list">			
					<?php if ($post->organizer){
						echo '<li class="info-tag" id="info-tag-organizer">';
						echo lang('event:organizer_post')." ";
						echo '<span style="font-weight:bold;">';										
						echo $post->organizer;
						echo '</span>';										
						echo '</li>';
					} ?>
				</ul>		
				<ul class="event_info_list">
					<?php if ($post->price){
						echo '<li class="info-tag" id="info-tag-price">';
						echo $post->price;
						echo '</li>';
					} ?>

				
					<?php if ($post->language){
						echo '<li class="info-tag" id="info-tag-language">';
						echo $post->language;
						echo '</li>';
					} ?>
					
					<li>Register <b>Here</b>
						
					</li>	
		
				</ul>
	
			</div>
	
			<div class="event_content">
				<?php echo $post->body; ?>
			</div>
		</div>	
	</div>
<?php endforeach; ?>

<?php echo $pagination['links']; ?>

<?php else: ?>
	<p><?php echo lang('event:currently_no_posts');?></p>
<?php endif; ?>