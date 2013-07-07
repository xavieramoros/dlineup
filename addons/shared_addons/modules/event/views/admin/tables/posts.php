<?php if ($event) : ?>
	<table border="0" class="table-list">
		<thead>
			<tr>
				<th width="20"><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')); ?></th>
				<th><?php echo lang('event:post_label'); ?></th>
				<th class="collapse"><?php echo lang('event:category_label'); ?></th>
				<th class="collapse"><?php echo lang('event:date_label'); ?></th>
				<th class="collapse"><?php echo lang('event:written_by_label'); ?></th>
				<th><?php echo lang('event:status_label'); ?></th>
				<th width="180"></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="7">
					<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?></div>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<?php foreach ($event as $post) : ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $post->id); ?></td>
					<td><?php echo $post->title; ?></td>
					<td class="collapse"><?php echo $post->category_title; ?></td>
					<td class="collapse"><?php echo format_date($post->created_on); ?></td>
					<td class="collapse">
					<?php if (isset($post->display_name)): ?>
						<?php echo anchor('user/' . $post->author_id, $post->display_name, 'target="_blank"'); ?>
					<?php else: ?>
						<?php echo lang('event:author_unknown'); ?>
					<?php endif; ?>
					</td>
					<td><?php echo lang('event:'.$post->status.'_label'); ?></td>
					<td>

                        <?php if($post->status=='live') : ?>
                            <?php echo anchor('event/' . date('Y/m',$post->created_on). '/'. $post->slug, lang('global:view'), 'class="btn green" target="_blank"');?>
                        <?php else: ?>
                            <?php echo anchor('event/preview/' . $post->preview_hash, lang('global:preview'), 'class="btn green" target="_blank"');?>
                        <?php endif; ?>
						<?php echo anchor('admin/event/edit/' . $post->id, lang('global:edit'), 'class="btn orange edit"'); ?>
						<?php echo anchor('admin/event/delete/' . $post->id, lang('global:delete'), array('class'=>'confirm btn red delete')); ?>
					</td>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>
<?php else: ?>
	<div class="no_data"><?php echo lang('event:currently_no_posts'); ?></div>
<?php endif; ?>

<?php if ($gcalConnected): ?>
	<div class="no_data">Google Calendar connected!</div>
<?php else: ?>
	<div class="no_data">Google Calendar not Connected<a class='login' href='<?php $authUrl ?>'>Connect Me!</a></div>
<?php endif; ?>

<?php if ($gcalRetrieveError): ?>
	<div class="no_data">Error retrieving Google Calendar Events</div>
<?php endif; ?>
