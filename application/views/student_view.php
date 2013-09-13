Student!!
<?php 
	echo form_open('controller/logout');
	echo form_submit('logout', 'Log Out');
	echo form_close();
	echo form_open(current_url());
	echo form_submit('redirect', 'Redirect');
	echo form_close();
	echo br(3);
	echo 'name: ' . $name . br();
	echo 'account_type: ' . $accnt_type . br();
	echo 'username: ' . $username . br();
?>