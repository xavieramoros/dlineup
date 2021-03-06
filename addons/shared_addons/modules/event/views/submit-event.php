 <section class="submit_form_container">		
		

		<?php echo form_open(); ?>
		<input type="hidden" name="submitevent_form" value="whatever">
		
		<fieldset style="border:0;">
		<div class="your_event_form">
			<h2>Submit your event
			</h2>
			<p class="georgia_text">Send us your event info so we can add it to our event agenda. This will help promote your event and increase the number of attendees: </p>
			<ul>
				<li ><label for="event_title"><?php echo lang('event:submit_event_title'); ?></label>
					<div class="form_input_wrapper">
						<div class="form_input"><?php echo form_input(array(
							'name'=>'event_title',	
							'class'	=>'input',							
							'value'=> empty($your_event->event_title)? "":$your_event->event_title,
							'id	'=>"event_title",							
							'maxlength'=>"100",
							'placeholder' => '',
							'autofocus'=>''
						));?>
						<script>
							if (!("autofocus" in document.createElement("input"))) {
								document.getElementById("event_title").focus();
								}
						</script>

						</div>
						<div class="form_error"><?php echo form_error('event_title'); ?>
						</div>						
					</div>
				</li>	
				
				<li><label for="event_link"><?php echo lang('event:submit_event_link'); ?> <span>*</span></label>
					<div class="form_input_wrapper">
						<div class="form_input">
						<?php echo form_input(array(
							'name'=>'event_link',	
							'class'	=>'input',							
							'value'=> empty($your_event->event_link)? "":$your_event->event_link,
							'id	'=>"event_link",							
							'maxlength'=>"100",
							'placeholder' => '',
							'required'=>''							
						));?>
						</div>
						<div class="submit_event_form_error red_text"><?php echo form_error('event_link'); ?>
						</div>	
					</div>
					
				</li>	
				<li><label for="your_name"><?php echo lang('event:submit_your_name'); ?> <span>*</span></label>
					<div class="form_input_wrapper">
						<div class="form_input">
						<?php echo form_input(array(
							'name'=>'your_name',
							'class'	=>'input',
							'value'=> empty($your_event->your_name)? "":$your_event->your_name,
							'id	'=>"your_name",							
							'maxlength'=>"50",
							'placeholder' => '',
							'required'=>''							
						));?>
						</div>											
						<div class="submit_event_form_error red_text"><?php echo form_error('your_name'); ?>
						</div>						
					</div>
				</li>	
				
				<li><label for="your_email"><?php echo lang('event:submit_your_email'); ?> <span>*</span></label>
					<div class="form_input_wrapper">
						<div class="form_input">
						<?php echo form_input(array(
							'name'=>'your_email',	
							'class'	=>'input',	
							'type'=>'email',						
							'value'=> empty($your_event->your_email)? "":$your_event->your_email,
							'id	'=>"your_email",							
							'maxlength'=>"50",
							'placeholder' => '',
							'required'=>''							
						));?>
						</div>						
						<div class="submit_event_form_error red_text"><?php echo form_error('your_email'); ?>
						</div>						
					</div>
				</li>	
			</ul>	
		</div>
		
		<div class="your_event_buttons">
			<?php echo form_submit(array(
					'type'=>"submit",
					'class'=> 'event_form_button',
					'name'=>'submit',
					'value'=>'Send'));?>
			<button class='event_form_button' onclick="location.href= '/'; return false;">Cancel</button>
		</div>

		</fieldset>	
		<?php echo form_close(); ?>
 </section>

