<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class College_page extends CI_Controller {
	
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
	
	//display the home page of the college page
	public function index() {
		
		if($this->session->userdata('userId')) {
			$id = $this->session->userdata('userId');
			//get the college initial
			$result = $this->college->getCollegeInitialOfThisStudent($id);
			$college_initial = $result->row();
			
			$data['title'] = $college_initial->college_initial;
			$admin_list = $this->college->getAdminsOfThisCollege($college_initial->college_initial);
			$data['admins'] = $admin_list;
			
			$governor = $this->college->getCollegeGovernor($college_initial->college_initial);
			//get governor details
			$governorDetails = $governor->row();
			$govId = $governorDetails->governor_id;	//governor id number
			$govFName = $governorDetails->fname;	//governor first name
			$govLName = $governorDetails->lname;	//governor last name
			
			$data['governorId'] = $govId;
			$data['governorFName'] = $govFName;
			$data['governorLName'] = $govLName;
			$this->load->view('header_view', $data);
			$this->load->view('college_first_part_view', $data);
			if($govId === $this->session->userdata('userId'))
				$this->load->view('college_governor_additional_view');
			$this->load->view('college_second_part_view');
			$this->load->view('footer_view');
		}
		else {
			redirect(site_url('controller'));
		}
		
	}
}

/*	End of File	*/