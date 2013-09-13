<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
/**
 * Controller for the ASISO project by:
 * @author Louie Kert Basay
 * @author Abdul Jalil Laguindab
 * @author Sherwin Cabili
 * @author Michael Arañas
*/

class Controller extends CI_Controller {
	
	//constructor
	 public function __construct() {
		parent::__construct();
		$this->load->helper(array('url', 'form', 'html'));
		$this->load->library(array('session', 'form_validation'));
		$this->load->model('Login_model', 'login');
	 }
	 
	 public function index() {
		 if(!$this->session->userdata('userID')) {
			$this->form_validation->set_rules('username', 'Username', 'required');
			$this->form_validation->set_rules('password', 'Password', 'required');
			$data['title'] = 'Asiso';
			$this->load->view('header_view', $data);
			$this->load->view('login_view');
			$this->load->view('footer_view');
		 }
		 else {
			 $accnt_type = $this->session->userdata('accntType');
			 redirect(site_url("controller/profileChooser/$accnt_type"));
		 }
	 }
	 //logs in the user
	 //if the query returns false, load user not found page
	 //otherwise, get the account type and pass to the profileChooser
	//	function to determine what view the user is entitled to.
	 public function login() {
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		
		$query = $this->login->log_user($username, $password);
		if($query == false) {
			//load user not found page
		}
		else {
			$accnt_type = $this->session->userdata('accntType');
			redirect(site_url("controller/profileChooser/$accnt_type"));
		}
	 }
	 
	 //chooses the kind of user that is logged in
	 //	and redirects the user to the interface associated to the
	 //	particular account type
	 public function profileChooser($accnt_type) {
		 $idNum = $this->session->userdata('userId');
		 $query = $this->login->getUser($idNum, $accnt_type);
		 $value = $query->row();
		 $data['name'] = $value->fname . $value -> lname;
		 $data['username'] = $value->username;
		 $data['accnt_type'] = $accnt_type;
		 $data['title'] = $value->username;
		 switch($accnt_type) {
			case 'student':
				$this->load->view('header_view', $data);
				$this->load->view('student_view', $data);
				$this->load->view('footer_view');
				break;
			case 'teacher':
				$this->load->view('header_view', $data);
				$this->load->view('teacher_view', $data);
				$this->load->view('footer_view');
				break;
		 }
	 }
	 
	 //logs out the user and redirects him/her to the login page
	 public function logout() {
		 $this->session->sess_destroy();
		 redirect(site_url('controller'));
	 }
 }
		



/* End of file */
