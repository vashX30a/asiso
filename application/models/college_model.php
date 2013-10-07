<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class College_model extends CI_Model {
	
	//constructor
	public function __construct() {
		parent::__construct();
		$this->load->database();
	}
	
	//created by kert
	//edits a college given its initials
	//$inital is the initial of the college
	//$whatToEdit is the column target to be edited
	//$newValue is the new value of the column to be edited
	//returns void
	public function editThisCollege($initial, $whatToEdit, $newValue) {
		$this->db->query("UPDATE college set $whatToEdit = '$newValue' where college_initial = '$initial'");
	}
	
	
}

/* End of File */
