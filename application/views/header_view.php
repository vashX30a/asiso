<!DOCTYPE html>

<html>
	<head>
		<title>
			<?php echo $title; ?>
		</title>
		<meta charset="utf-8">
		<meta name ="author" content="Louie Kert Basay">
		<meta name ="author" content="Abdul Jalil Laguindab">
		<meta name ="author" content="Sherwin Cabili">
		<meta name ="author" content="Michael June Arañas">
		<link rel="stylesheet" type="text/css" href= "<?php echo base_url() ?>css/MSUIIT.css" />
		<link rel="icon" type="image/ico" href="<?php echo base_url() ?>img/msuiitlogo.ico">
		<script type="text/javascript" src="<?php echo base_url() ?>js/date_time.js"></script>
	</head>
	
	
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