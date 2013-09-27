<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Student_model extends CI_Model {
	
	public function __construct() {
		parent::__construct();
		$this->load->database();
	}
	
	//get student information by the student's id-number
	//if no result found, return false
	//otherwise, return a query object
	public function getStudent($idNumber) {
		$query = $this->db->query("Select * from Student where idnumber = '$idNumber'");
		if($query->num_rows() == 0)
			return false;
		return $query;
	}
	
	//get the course/college of the student given his/her id-number
	//if no result found, return false
	//otherwise, return a query object
	public function getStudentCourseAndCollege($idNumber) {
		$query = $this->db->query("Select college, course from Belongs where stud_id = '$idNumber'");
		if($query->num_rows() == 0)
			return false;
		return $query;
	}
	
	//get the event records for a particular student given his/her id-number
	//if no result found, return false
	//otherwise, return a query object
	public function getStudentEventRecords($idNumber) {
		$query = $this->db->query("Select * from Attends where stud_id = '$idNumber'");
		if($query->num_rows() == 0)
			return false;
		return $query;
	}
}

/* End of file */
