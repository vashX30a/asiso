<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class College_model extends CI_Model {
	
	//constructor
	public function __construct() {
		parent::__construct();
		$this->load->database();
	}
	
	/**
	 *	created by kert
	 *	edits a college given its initials
	 *	@$inital is the initial of the college
	 *	@$whatToEdit is the column target to be edited
	 *	@$newValue is the new value of the column to be edited
	 *	@returns void
	 */
	public function editThisCollege($initial, $whatToEdit, $newValue) {
		$this->db->query("UPDATE college set $whatToEdit = '$newValue' where college_initial = '$initial'");
	}
	
	/**
	 *	retrieves student's information who holds administrative rights to a *certain college
	 *	if nothing is retrieved, @returns false
	 *	otherwise, @return the query object
	 */
	public function getAdminsOfThisCollege($initial) { 
		$query = $this->db->query("SELECT s.idnumber, s.fname, s.minit, s.lname, s.year FROM student s JOIN belongs b ON b.stud_id = s.idnumber WHERE b.college = '$initial' and s.isadmin = 't'");
		if($query->num_rows() == 0)
			return FALSE;
		return $query;
	}
	
	/**
	 *	Gets the initial of the college where a specified student belongs
	 *	@return the query object
	 */
	 public function getCollegeInitialOfThisStudent($idnumber) {
		$query = $this->db->query("SELECT c.college_initial FROM college c join belongs b on c.college_initial = b.college WHERE b.stud_id = '$idnumber'");
		return $query;
	 }
	 
	 public function getCollegeGovernor($collegeId){
		$query = $this->db->query("SELECT c.governor_id, s.fname, s.lname FROM student s JOIN college c ON s.idnumber = c.governor_id WHERE c.college_initial = '$collegeId'");
		return $query;
	}
	/*
	public function getCollegeGovernorLname($collegeId){
		$query = $this->db->query("SELECT s.lname FROM student s JOIN college c ON s.idnumber = c.governor_id WHERE c.college_initial = '$collegeId'");
		return $query;
	}*/
}

/* End of File */
