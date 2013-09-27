<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model {
	
	public function __construct() {
		parent::__construct();
		$this->load->database();
	}
	
	//retrieves information of a user given his/her username and password
	//searches the student table
	//if the user is found, returns the query object
	//if nothing is found, the function returns false.
	public function log_user($username, $password) {
		$result = $this->db->query("Select * from student where username = '$username'
			and password = '$password'");
		if($result->num_rows() == 0) {
			return false;
		}
		else {
			$value = $result->row();
			$sessData = array (
				'userId' => $value->idnumber,
				'accntType' => $value->isadmin
			);
			$this->session->set_userdata($sessData);
			return $result;
		}
	}
	
}

/* End of file */
