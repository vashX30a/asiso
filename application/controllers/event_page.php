<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Event_page extends CI_Controller {
	
	public function __construct() {
		parent::__construct();
		$this->load->library(array('session'));
		$this->load->helper(array('url', 'form', 'html'));
		$this->load->model('student_model', 'student');
		$id = $this->session->userdata('userId');
		$params = array('id' => $id);
		$this->load->driver('student', $params);
	}
	
	public function index() {
		
		if($this->session->userdata('userId')) {
			$data['title'] = 'Event';
			$this->load->view('header_view', $data);
			//$this->load->view('college_home_view', $data);
			$this->load->view('footer_view');
		}
		else {
			redirect(site_url('controller'));
		}
		
	}
}

/*	End of File	*/