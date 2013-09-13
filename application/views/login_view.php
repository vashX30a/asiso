<?php 
	echo form_open('controller/login');
	echo 'Username' . form_input('username');
	echo br();
	echo 'Password' . form_password('password');
	echo br();
	echo form_submit('login', 'Log in');
	echo form_close();
	echo br(3); 
?>
		
