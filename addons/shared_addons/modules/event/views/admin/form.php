<section class="title">
<?php if ($this->method == 'create'): ?>
	<h4><?php echo lang('event:create_title'); ?></h4>
<?php else: ?>
	<h4><?php echo sprintf(lang('event:edit_title'), $post->title); ?></h4>
<?php endif; ?>
</section>

<section class="item">
	
<?php echo form_open_multipart(); ?>

<div class="tabs">

	<ul class="tab-menu">
		<li><a href="#event-content-tab"><span><?php echo lang('event:content_label'); ?></span></a></li>
		<li><a href="#event-options-tab"><span><?php echo lang('event:options_label'); ?></span></a></li>
	</ul>
	
	<!-- Content tab -->
	<div class="form_inputs" id="event-content-tab">
		<fieldset>
	
		<ul>
			<li>
				<label for="title"><?php echo lang('global:title'); ?> <span>*</span></label>
				<div class="input"><?php echo form_input('title', htmlspecialchars_decode($post->title), 'maxlength="100" id="title"'); ?></div>				
			</li>
			<li>
				<label for="link"><?php echo lang('event:event_link'); ?> <span>*</span></label>
				<div class="input"><?php echo form_input('event_link', htmlspecialchars_decode($post->event_link), 'maxlength="100" id="event_link"'); ?></div>		</li>
			<li>
				<label for="slug"><?php echo lang('global:slug'); ?> <span>*</span></label>
				<div class="input"><?php echo form_input('slug', $post->slug, 'maxlength="100" class="width-20"'); ?></div>
			</li>
			
			<li>
				<label for="status"><?php echo lang('event:status_label'); ?></label>
				<div class="input"><?php echo form_dropdown('status', array('draft' => lang('event:draft_label'), 'live' => lang('event:live_label')), $post->status) ?></div>
			</li>
			
			<!--Added by Xavi-->
			<li class="date-meta">
				<label><?php echo lang('event:start_date_label'); ?> <span>*</span></label>
				
				<div class="input datetime_input">
						<!-- <?php echo form_input('start_date', date('d-m-Y', (int)$post->start_date), 'maxlength="10" id="datepicker2" class="text width-20"'); ?> &nbsp; -->
						<?php echo form_input('start_date', empty($post->start_date)? '' : $post->start_date,'maxlength="10" id="datepicker2" class="text width-20"'); 
							//first time $post->start_date empty, so we show "", if error submitting, then we show the selected date if any.
							
						?> &nbsp;
				</div>
			</li>

			<li class="date-meta">
				<label><?php echo lang('event:end_date_label'); ?> </label>
				<div class="input datetime_input">
					<?php echo form_input('end_date',empty($post->end_date)? '' : $post->end_date,'maxlength="10" id="datepicker" class="text width-20"'); ?> &nbsp;
				</div>
			</li>			
			<li class="time-meta">
				<label><?php echo lang('event:start_time'); ?></label>
				<div>				
<!--
					<?php echo form_dropdown('starts_on_hour', $start_hours, $post->starts_on_hour ? $post->starts_on_hour : ''); ?>  
					<?php echo form_dropdown('starts_on_minute', $start_minutes, $post->starts_on_minute ? $post->starts_on_minute : '');?>
-->
					<?php $data_starts_on_hour = array(
			              'name'        => 'starts_on_hour',
			              'id'          => 'starts_on_hour',
			              'value'       => $post->starts_on_hour ? $post->starts_on_hour : '',
			              'maxlength'   => '2',
			              'size'        => '50',
			              'style'       => 'width:20px',
			            );
					
					echo form_input($data_starts_on_hour); ?>:
				
					<?php $data_starts_on_minute = array(
			              'name'        => 'starts_on_minute',
			              'id'          => 'starts_on_minute',
			              'value'       => $post->starts_on_minute ? $post->starts_on_minute : '',
			              'maxlength'   => '2',
			              'size'        => '50',
			              'style'       => 'width:20px',
			            );
					
					echo form_input($data_starts_on_minute); ?>  

				</div>		
				
				<label><?php echo lang('event:end_time'); ?></label>
				<div>				
					<?php $data_ends_on_hour = array(
			              'name'        => 'ends_on_hour',
			              'id'          => 'ends_on_hour',
			              'value'       => $post->ends_on_hour ? $post->ends_on_hour : '',
			              'maxlength'   => '2',
			              'size'        => '50',
			              'style'       => 'width:20px',
			            );
					
					echo form_input($data_ends_on_hour); ?>:
					
					<?php $data_ends_on_minute = array(
			              'name'        => 'ends_on_minute',
			              'id'          => 'ends_on_minute',
			              'value'       => $post->ends_on_minute ? $post->ends_on_minute : '',
			              'maxlength'   => '2',
			              'size'        => '50',
			              'style'       => 'width:20px',
			            );
					
					echo form_input($data_ends_on_minute); ?>  

				</div>		
			</li>

			<li>
				<label for="price"><?php echo lang('event:price'); ?></label>
				<div class="input"><?php echo form_input('price', htmlspecialchars_decode($post->price), 'maxlength="100" id="price"'); ?></div>				
			</li>
			<li>
				<label for="address"><?php echo lang('event:address'); ?></label>
				<div class="input"><?php echo form_input('address', htmlspecialchars_decode($post->address), 'maxlength="100" id="address"'); ?></div>					
			</li>
			<li>
				<label for="location"><?php echo lang('event:location'); ?></label>
				<div class="input"><?php echo form_input('location', htmlspecialchars_decode($post->location), 'maxlength="100" id="location"'); ?></div>				
			</li>
			<li>
				<label for="organizer"><?php echo lang('event:organizer'); ?></label>
				<div class="input"><?php echo form_input('organizer', htmlspecialchars_decode($post->organizer), 'maxlength="100" id="organizer"'); ?></div>			</li>
			<li>
				<label for="link"><?php echo lang('event:organizer_link'); ?> </label>
				<div class="input"><?php echo form_input('organizer_link', htmlspecialchars_decode($post->organizer_link), 'maxlength="100" id="organizer_link"'); ?></div>							</li>
				

			<li>
				<label for="language"><?php echo lang('event:event_language'); ?></label>
				<div class="input"><?php echo form_input('language', htmlspecialchars_decode($post->language), 'maxlength="50" id="link"'); ?></div>					</li>
			<!--End of Added by Xavi-->
			
			<!--			
			<li>
				<label for="intro"><?php echo lang('event:intro_label'); ?></label>
				<br style="clear: both;" />
				<?php echo form_textarea(array('id' => 'intro', 'name' => 'intro', 'value' => $post->intro, 'rows' => 5, 'class' => 'event wysiwyg-simple')); ?>
			</li>
			-->
			
			<li class="editor">
				<label for="body"><?php echo lang('event:content_label'); ?><span>*</span></label>
				
				<div class="input">
					<?php echo form_dropdown('type', array(
						'html' => 'html',
						'markdown' => 'markdown',
						'wysiwyg-simple' => 'wysiwyg-simple',
						'wysiwyg-advanced' => 'wysiwyg-advanced',
					), $post->type); ?>
				</div>
				
				<br style="clear:both"/>
				
				<?php echo form_textarea(array('id' => 'body', 'name' => 'body', 'value' => $post->body, 'rows' => 30, 'class' => $post->type)); ?>
				
			</li>
		</ul>
        <?php echo form_hidden('preview_hash',$post->preview_hash)?>
		</fieldset>
		
	</div>

	<!-- Options tab -->
	<div class="form_inputs" id="event-options-tab">
	
		<fieldset>
		
		<ul>
			<li>
				<label for="category_id"><?php echo lang('event:category_label'); ?></label>
				<div class="input">
				<?php echo form_dropdown('category_id', array(lang('event:no_category_select_label')) + $categories, @$post->category_id) ?>
					[ <?php echo anchor('admin/event/categories/create', lang('event:new_category_label'), 'target="_blank"'); ?> ]
				</div>
			</li>
			
			<li>
				<label for="keywords"><?php echo lang('global:keywords'); ?></label>
				<div class="input"><?php echo form_input('keywords', $post->keywords, 'id="keywords"') ?></div>
			</li>
						
			<li class="date-meta">
				<label><?php echo lang('event:date_label'); ?></label>
				
				<div class="input datetime_input">
				<?php echo form_input('created_on', date('Y-m-d', (int)$post->created_on), 'maxlength="10" id="datepicker3" class="text width-20"'); ?> &nbsp;
				<?php echo form_dropdown('created_on_hour', $hours, date('H', (int)$post->created_on)) ?> : 
				<?php echo form_dropdown('created_on_minute', $minutes, date('i', (int)ltrim($post->created_on, '0'))) ?>
				
				</div>
			</li>
			
			<li>
				<label for="comments_enabled"><?php echo lang('event:comments_enabled_label');?></label>
				<div class="input"><?php echo form_checkbox('comments_enabled', 1, ($this->method == 'create' && ! $_POST) or $post->comments_enabled == 1, 'id="comments_enabled"'); ?></div>
			</li>
		</ul>

		</fieldset>
		
	</div>

</div>

<div class="buttons">
	<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'save_exit', 'cancel'))); ?>
</div>

<?php echo form_close(); ?>

</section>

<style type="text/css">
form.crudli.date-meta div.selector {
    float: left;
    width: 30px;
}
form.crud li.date-meta div input#datepicker { width: 8em; }
form.crud li.date-meta div.selector { width: 5em; }
form.crud li.date-meta div.selector span { width: 1em; }
form.crud li.date-meta label.time-meta { min-width: 4em; width:4em; }
</style>