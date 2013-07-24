<?php if (isset($category->title)): ?>
	<h2 id="page_title"><?php echo $category->title; ?></h2>

<?php elseif (isset($tag)): ?>
	<h2 id="page_title"><?php echo lang('event:tagged_label').': '.$tag; ?></h2>

<?php endif; ?>

<?php if ( ! empty($event)): ?>

<?php foreach ($event as $key=>$post): ?>
	<div class="event_post event_post_<?php echo $key; ?>">
		<!-- Post heading -->
		<div class="event_header">
			<div class="event_date">
	<!-- 			<?php echo lang('event:posted_label');?>:  -->
				<?php echo format_date($post->start_date, 'd/m'); ?>
			</div>
			
			<div class="event_title">
				<!--<h3><?php echo  anchor('event/'.date('Y/m/', $post->created_on).$post->slug, $post->title); ?></h3>-->
				
<!--
				<?php// if (strlen($post->title)>55){
					//cut title and append ...
					//	$post->title = substr($post->title,0,55)."...";
					//}
				?>

				<script>

					function checkOverflow(el)
					{
					   var curOverflow = el.style.overflow;
					   if ( !curOverflow || curOverflow === "visible" )
					      el.style.overflow = "hidden";
					
					   var isOverflowing = el.clientWidth < el.scrollWidth 
					      || el.clientHeight < el.scrollHeight;
					
					   el.style.overflow = curOverflow;
					
					   return isOverflowing;
					}
				</script>

				<script>
					$(function(){
						// save selector to UL
						var $liArray = $('ul.demo').children('li');
   
						// var to hold height of one line
						// this line needs to be changed to fit
						// your layout.
						var lineHeight = 20;
						$liArray.each(function(){
							var $this = $(this);
							if ($this.height() == lineHeight) {
								$this.addClass('oneLine')
								return true;
							}
							if ($this.height() == lineHeight*2) {
								$this.addClass('twoLine')
								return true;
							}
							$this.addClass('threeLine')
						});
					});
				</script>
				
-->
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
					<?php if (date('H:i',$post->start_date)!="11:11"){
						echo '<li class="info-tag" id="info-tag-time">';
						echo '<span style="font-weight:bold;">';					
						echo date('H:i',$post->start_date);
						if(date('H:i',$post->end_date)!="11:11"){
							echo "-".date('H:i',$post->end_date);
						}
						echo '</span>';										
						echo '</li>';
					} ?>
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
							
				</ul>
			</div>
			<div class='event_content'>
<!-- 			<?php echo"<div class='event_content content_index".$key."'>"?> -->
				<?php echo $post->body; ?>
			</div>
			<?php 
				if (strlen($post->body)>200){
					//echo "<input type='button' class='btn_show_content' value='+'>";
					//echo "<button type='submit' class='btn_show_content'><img src=''></button>";
			?> 
				{{ theme:image class="btn_show_content tooltip-e" id="expand_button" file="expand.png" alt="Show more" title="Show more"}}

			<?php 	}
			?>
					
		</div>	
	</div>
<?php endforeach; ?>

<?php echo $pagination['links']; ?>

<?php else: ?>
	<div class="event_post">
		<div class="event_title">
			<h3><a>HERE FIXME!<?php echo lang('event:currently_no_posts');?></a></h3>
		</div>
	</div>
<?php endif; ?>

