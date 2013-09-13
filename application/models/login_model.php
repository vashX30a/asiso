<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login_model extends CI_Model {
	
	public function __construct() {
		parent::__construct();
		$this->load->database();
	}
	
	//retrieves information of a user given his/her username and password
	//first searches the student table, then if not found searcher the teacher table
	//if user found, sets session userId and accntType to either teacher or student
	//	and returns the object.
	//if nothing is really found, the function returns false.
	public function log_user($username, $password) {
		$result = $this->db->query("Select * from student where username = '$username'
			and password = '$password'");
		if($result->num_rows() == 0) {
			$result = $this->db->query("Select * from teacher where 
				username = '$username' and password = '$password'");
			if($result->num_rows() != 0) {
				$value = $result->row();
				$sessData = array(
					'userId' => $value->idnumber,
					'accntType' => 'teacher'
				);
				$this->session->set_userdata($sessData);
				return $result;
			}
			else
				return false;
		}
		else {
			$value = $result->row();
			$sessData = array (
				'userId' => $value->idnumber,
				'accntType' => 'student'
			);
			$this->session->set_userdata($sessData);
			return $result;
		}
	}
	
	//gets user with the id number and account type
	public function getUser($idNum, $accnt_type) {
		switch($accnt_type) {
			case 'student':
				$result = $this->db->query("Select * 
					from student where idNumber = '$idNum'");
				break;
			case 'teacher':
				$result = $this->db->query("Select *
					from teacher where idNumber = '$idNum'");
				break;
		}
		return $result;
	}
	
}

/* End of file */
