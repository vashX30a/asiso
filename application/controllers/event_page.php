<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Event_page extends CI_Controller {
	
	//controller
	//note: sessions are located in Login_model file
	public function __construct() {
		parent::__construct();
		$this->load->library(array('session'));
		$this->load->helper(array('url', 'form', 'html'));
		$this->load->model('student_model', 'student');
		$this->load->model('college_model', 'college');
		$id = $this->session->userdata('userId');
		$params = array('id' => $id);
		$this->load->driver('student', $params);
	}
	
	//display the home page for the events page
	public function index() {
		
		if($this->session->userdata('userId')) {
			$id = $this->session->userdata('userId');
			//get initial of this student's college
			$query = $this->college->getCollegeInitialOfThisStudent($id)->row();
			$college = $query->college_initial;
			//get id number of the college's governor
			$query2 = $this->college->getCollegeGovernor($college)->row();
			$college_gov = $query2->governor_id;
			
			$data['title'] = $college;
			
			$this->load->view('header_view', $data);
			$this->load->view('event_first_part_view', $data);
			if($college_gov == $this->session->userdata('userId'))
				$this->load->view('event_governor_additional_view');
			$this->load->view('event_second_part_view');
			$this->load->view('footer_view');
		}
		else {
			redirect(site_url('controller'));
		}
		
	}
}

/*	End of File	*/