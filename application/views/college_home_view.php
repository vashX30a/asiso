<body>
	<!--MSUIIT Logo-->
	<p><center><img src="<?php echo base_url() ?>img/iit-logo.gif" width="94" height="94" align="texttop" longdesc="<?php echo base_url() ?>img/iit-logo.gif" />
	</center></p>
	<!-- ID header -->
	<div id="header">
		<h1>MSU-IIT ATTENDANCE CHECKER</h1>
		<span id="date_time"></span>
			<script type="text/javascript">window.onload = date_time('date_time');</script>
	</div>
	<!--Code for the dropdown navmenu -->
	<div id = "tab">
		<ul id ="navmenu">
			<li><a href= "<?php echo site_url('student_page') ?>" >Profile</a></li>
			<li><a href= "<?php echo site_url('college_page') ?>" ><?php echo $title ?></a></li>
			<li><a href= "<?php echo site_url('event_page') ?>">Events</a></li>
			<li><a href= "<?php echo site_url('controller/logout') ?>" >Sign-out</a></li>
		</ul>	
	</div>
	
	<div class = "content">
		Display All Adminis here <br>
		Admin Students are given rights to add admins<br>
		and do other functionalities<br>
		Governor have additional functionalities
	</div>
	<div id="well">
		<center><li><a href ="#">All rights reserved 2013. </a></li></center>
		<center><li><a href ="#">Copyright &copy Snoop Dogs</a></li></center>
	</div>
</body>