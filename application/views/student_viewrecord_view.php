<table border = 1 cellpadding = 2 cellspacing = 0>
<th>Event Name</th>
<th>Date</th>
<th>Signed in</th>
<th>Signed out</th>

<?php 
	//log out button
	echo form_open('controller/logout');
	echo form_submit('logout', 'Log Out');
	echo form_close();
	//redirect button--to check if session works properly
	echo form_open(current_url());
	echo form_submit('redirect', 'Redirect');
	echo form_close();
	//home button
	echo form_open('student_page');
	echo form_submit('home', 'Home');
	echo form_close();

	//table for the records
	foreach($records as $r) {
		echo '<tr align = \'center\'>';
		echo '<td>' . $r['name'] . '</td>';
		echo '<td>' . $r['date'] . '</td>';
		echo '<td>';
		echo $r['signed_in'] ? 'yes' : 'no';
		echo '</td>';
		echo '<td>';
		echo $r['signed_out'] ? 'yes' : 'no';
		echo '</td>';
		echo '</tr>';
	}
	echo '</table>';
	echo br(3);
?>
