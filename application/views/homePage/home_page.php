<!DOCTYPE html>
<html>
	<head>
		<title> 
			<?php 
				$display = explode('_', $title);
				for($i = 0; $i < count($display); $i++)
					echo ucfirst($display[$i]).' ';	//capitalize first letters
			echo "\n";
			?> 
		</title>
		<link rel="stylesheet" type="text/css" href="/asiso/css/homepage/log_in.css">
	</head>

	<body>
		<div class="title">
				<div class="title" id="intro">ASISO</div>
				<div class="title" id="sub-intro">
				Automated Sign-in Sign-out<br>
				An open source software
				</div>
		</div>
			
		<div id="fillup_forms">			
			<!form action="" method="post">
			<form>
				username<input type="text" name="username"><br>
				password<input type="password" name="password">
			</form>
		</div>
		<hr id="upper">
		<?php
			//about ASISO starts here
		?>
		
		<hr id="footnote" />
		<div id="footnote">
			<a><u>About ASISO</u></a>
			<a><u>Developers</u></a>
			<a><u>Help</u></a>
		</div>
	</body>
</html>	