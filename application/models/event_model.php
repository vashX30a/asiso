<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Event_model extends CI_Model {
	
	public function __construct() {
		parent::__construct();
		$this->load->database();
	}
	
	//gets the events of a college
	//if the college does not have any events, return false
	//otherwise, return the query
	public function getEventsOfACollege($college) {
		$query = $this->db->query("Select * from event where college_owner = '$college'");
		if($query->num_rows() == 0)
			return false;
		return $query;
	}
}


/*	End of file */
