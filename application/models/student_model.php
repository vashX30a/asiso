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
	
	//gets the set of events that can be participated by this student
	//if no result found, return false
	//otherwise, return a query object
	public function getEventsOfThisStudent($stud_id) {
		$query = $this->db->query("Select e.name, e.date, a.signed_in, a.signed_out from event e join attends a on e.eventid = a.event_id where a.stud_id = '$stud_id'");
		if($query->num_rows() == 0)
			return false;
		return $query;
	}
	
	//checks if the particular student is already signed in to a particular event
	//if no result found, return false
	//otherwise, return a true
	public function isStudentSignedInToAnEvent($stud_id, $event_id) {
		//TODO
	}
	
	//checks if the particular student is already singed out to a particular event
	//if no result found, return false
	//otherwise, return true
	public function isStudentSignedOutToAnEvent($stud_id, $event_id) {
		//TODO
	}
	
}

/* End of file */
