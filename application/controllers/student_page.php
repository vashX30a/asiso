<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Student_page for the ASISO project by:
 * @author Louie Kert Basay
 * @author Abdul Jalil Laguindab
 * @author Sherwin Cabili
 * @author Michael Arañas
*/

class Student_page extends CI_Controller {
	
	//constructor
	public function __construct() {
		parent::__construct();
		$this->load->library(array('session'));
		$this->load->helper(array('url', 'form', 'html'));
		$this->load->model('student_model', 'student');
		$id = $this->session->userdata('userId');
		//set parameter for student object
		$params = array(
			'id' => $id
		);
		$this->load->library('student', $params);
	}
	
	//displays the home page of the student
	public function index() {
		if($this->session->userdata('userId')) {
			//set data array
			$data['title'] = 'Home Page';
			$data['name'] = $this->student->getName();
			$data['username'] = $this->student->getUsername();
			
			//load views
			$this->load->view('header_view', $data);
			$this->load->view('student_view', $data);
			$this->load->view('footer_view');
		}
		else
			redirect(site_url('controller'));
	}
	
	//display the current students records
	public function displayThisStudentRecord() {
		if($this->session->userdata('userId')) {
			//set data array
			$data['title'] = $this->student->getName() . '\'s Records'; 
			$data['records'] = $this->student->getThisStudentEventRecord();
			
			//load views
			$this->load->view('header_view', $data);
			$this->load->view('student_viewrecord_view', $data);
			$this->load->view('footer_view');
		}
		else
			redirect(site_url('controller'));
	}
	
}

/* End of file */
