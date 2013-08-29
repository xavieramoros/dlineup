
<?php if (isset($category->title)): ?>
	<h2 id="page_title"><?php echo $category->title; ?></h2>

<?php elseif (isset($tag)): ?>
	<h2 id="page_title"><?php echo lang('event:tagged_label').': '.$tag; ?></h2>

<?php endif; ?>

<?php if ( ! empty($event)): ?>

<?php foreach ($event as $key=>$post): ?>
	<?php if($key==0){
		$initial_month=date("n",$post->start_date);//month of first post

		echo "<div class='month_separator month_separator_0'>";
		echo "<a id=".date("F",$post->start_date)."_".date("Y",$post->start_date)."></a>";
		echo "<span class='red_text'>".date("F",$post->start_date)."</span>"	;
		echo "</div>";
		$previous_month=$initial_month;
	}else if(date("n",$post->start_date)!=$previous_month){
		echo "<div class='month_separator'>";
		echo "<a id=".date("F",$post->start_date)."_".date("Y",$post->start_date)."></a>";
		echo "<span class='red_text'>".date("F",$post->start_date)."</span>"	;
		echo "</div>";
		
		$previous_month=date("n",$post->start_date);
	}
	?>
	
		
	<div class="event_post event_post_<?php echo $key; ?>">
		<!-- Post heading -->
		<div class="event_header">
			<div class="event_date">
	<!-- 			<?php echo lang('event:posted_label');?>:  -->
				<?php echo format_date($post->start_date, 'd/m'); ?>
			</div>
			
			<div class="event_title">
				<!--<h3><?php echo  anchor('event/'.date('Y/m/', $post->created_on).$post->slug, $post->title); ?></h3>-->
				<h3><a href="<?php echo($post->event_link)?>" rel="no_follow" target="_blank"><?php echo($post->title);?></a>
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
					<?php date_default_timezone_set('Europe/Madrid');?>
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
						if($post->organizer_link){
							echo '<a href='.$post->organizer_link.' rel="no_follow" target="_blank">';							
							echo $post->organizer;	
							echo '</a>';
						}
						else{
							echo $post->organizer;								
						}
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
				<?php echo $post->body; ?>
			</div>
			<?php if (strlen($post->body)>200){	?> 
				{{ theme:image class="btn_show_content tooltip-e" id="expand_button" file="expand.png" alt="Show more" title="Show more"}}
			<?php }?>
			<div class="event_buttons_box">
				<ul class="ul_horizontal">
					<li><a href="http://example.com/link-to-your-event" title="Add to Calendar" class="addthisevent" style="border-style: none">{{ theme:image file='./share_icons/calendar_share_icon.png' alt="Facebook Share" width="20" height="20" border="0"}}
						    <span class="_start"><?php echo date("d-m-Y H:i:s",$post->start_date);?></span>
						    <span class="_end"><?php echo date("d-m-Y H:i:s",$post->end_date);?></span>
						    <span class="_zonecode">40</span>
						    <span class="_summary"><?php echo $post->title;?></span>
						    <span class="_description"><?php echo substr(htmlspecialchars($post->body,ENT_HTML5),0,1000);?></span>
						    <span class="_location"><?php echo $post->location." ".$post->address;?></span>
						    <span class="_organizer"><?php echo $post->organizer;?></span>
						    <span class="_all_day_event">false</span>
						    <span class="_date_format">DD/MM/YYYY</span>				    
						    </a> 
						    </li>
					<!--  "ADD THIS" SOCIAL BUTTONS				 -->
					<li><a class="addthis_button_facebook social_button" addthis:description="" addthis:url="<?php echo $post->event_link;?>" addthis:title="<?php echo $post->title."via Dlineup";?>" >{{ theme:image file='./share_icons/facebook_share_icon.png' alt="Facebook Share" width="21px" height="21px"}}
					</a>
					</li>					
					<li><a class="addthis_button_twitter social_button" addthis:description="" addthis:url="<?php echo $post->event_link."&nbsp;via&nbsp;&#64;dlineup";?>" addthis:title="<?php echo $post->title;?>" >{{ theme:image file='./share_icons/twitter_share_icon.png' alt="Twitter Share" width="21px" height="21px"}}
					</a>
					</li>
					<li><a class="addthis_button_google_plusone_share social_button" addthis:description="via Dlineup.net" addthis:url=<?php echo $post->event_link;?> addthis:title=<?php echo $post->title."via Dlineup.net";?>>{{ theme:image file='./share_icons/gplus_share_icon.png' alt="G+ Share" width="21px" height="21px"}}
					</a>
					</li>
					<li><a class="addthis_button_email social_button" addthis:url="<?php echo $post->event_link;?>" addthis:title="<?php echo $post->title;?>"  addthis:description="via Dlineup.net">{{ theme:image file='./share_icons/email_share_icon.png' alt="Email Share" width="21px" height="21px" border="0"}}
					</a>
					</li>										
				</ul>
			</div>			
		</div>
		
		<div class="add_to_cal">	
		</div>
	</div>
<?php endforeach; ?>

<?php echo $pagination['links']; ?>

<?php else: ?>
	<div class="event_post">
		<div class="event_title no_posts_message">
			<h3><a><?php echo lang('event:currently_no_posts');?></a></h3>
		</div>
	</div>
<?php endif; ?>

