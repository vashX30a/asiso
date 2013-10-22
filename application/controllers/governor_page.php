<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	class Governor_page extends CI_Controller {
		
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
		
		public function index() {
			if($this->session->userdata('userId')) {
				$id = $this->session->userdata('userId');
				//get the college initial
				$result = $this->college->getCollegeInitialOfThisStudent($id)->row();
				$college_initial = $result->college_initial;

				$data['title'] = $college_initial . ' Governor';
				$data['college'] = $college_initial;
				$this->load->view('header_view', $data);
				$this->load->view('governor_home_view', $data);
				$this->load->view('footer_view');
			}
			else {
				redirect(site_url('controller'));
			}
		}
	}