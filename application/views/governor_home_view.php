	<!--Code for the dropdown navmenu -->
	<div id = "tab">
		<ul id ="navmenu">
			<li><a href= "<?php echo site_url('student_page') ?>" >Profile</a></li>
			<li><a href= "<?php echo site_url('college_page') ?>" ><?php echo $college ?></a></li>
			<li><a href = "<?php echo current_url() ?>" >Governor's Page</a></li>
			<li><a href= "<?php echo site_url('event_page') ?>">Events</a></li>
			<li><a href= "<?php echo site_url('controller/logout') ?>" >Sign-out</a></li>
		</ul>	
	</div>