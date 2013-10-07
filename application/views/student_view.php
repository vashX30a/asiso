Student!!
<?php 
	echo 'name: ' . $name . br();
	echo 'username: ' . $username . br();
	echo br();
	
	//log out button
	echo form_open('controller/logout');
	echo form_submit('logout', 'Log Out');
	echo form_close();
	//redirect button--to check if session works properly
	echo form_open(current_url());
	echo form_submit('redirect', 'Redirect');
	echo form_close();
	//view records button
	echo form_open('student_page/displayThisStudentRecord');
	echo form_submit('view_records', 'View Records');
	echo form_close();
	
?>