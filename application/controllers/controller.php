<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	/**
	 * Controller for the ASISO project by:
	 * @author Louie Kert Basay
	 * @author Abdul Jalil Laguindab
	 * @author Sherwin Cabili
	 * @author Michael Arañas
	*/
	
	class Controller extends CI_Controller {
		
		/*
		 * Constructor
		 */
		 public function __construct() {
			parent::__construct();
			$this->load->helper(array('url'));	//load helpers
			//$this->load->library(array('session'));	//load libraries
		 }
		
		/*
		 * default entry point of the program
		 * default uri: localhost/asiso/index.php/
		 */
		public function index() {
			$param = 'home_page';
			$data['title'] = $param;
			$this->load->view('homePage/' . $param, $data);
		}
		
		/*
		 * redirects you to add on pages located at:
		 * asiso/application/views/addOnPage
		 * 
		 * @param the page to be loaded and redirected to
		 */
		 public function addOnPage($param) {
			if($param != null) {
				$data['title'] = $param;
				$this->load->view('addOnPage/' . $param, $data);
			}
		 }
	}



//omitted closing php tag
