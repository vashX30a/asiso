<body>
	<!--MSUIIT Logo-->
		<p><center><img src="<?php echo base_url() ?>img/iit-logo.gif" width="94" height="94" align="texttop" longdesc="<?php echo base_url() ?>img/iit-logo.gif" />
		</center></p>
	<!-- ID header -->
	<div id="header">
		<h1>MSU-IIT ATTENDANCE CHECKER</h1>
	</div>
	<!--Code for the dropdown navmenu -->
	<div>
		<ul id ="navmenu">
			<li><a href= <?php echo current_url() ?> >Home</a></li>
			<li><a href="#">Records</a><span class="darrow">&#9660;</span>
				<ul class="sub1">
					<li><a href="<?php echo site_url('student_page/displayThisStudentRecord') ?>">Event Record</a>
				</ul>
			</li>
			<li><a href= <?php echo site_url('controller/logout'); ?> >Sign-out</a></li>
		</ul>	
	</div>
	
	
	<!--Content of the page-->
	<div id = "content">
		<center>
		<?php 
			echo 'username: ' . $username  . '<br/>';
			echo 'name: ' . $name . '<br/>';
		?>
		//add picture
		//design more
		</center>
	</div>
</body>