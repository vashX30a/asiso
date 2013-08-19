<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	/**
	 * Controller for the ASISO project by:
	 * Louie Kert Basay
	 * Abdul Jalil Laguindab
	 * Sherwin Cabili
	 * Michael Arañas
	*/
	
	class Controller extends CI_Controller {
		
		/*
		 * Constructor
		 */
		 public function __contruct() {
			 parent::__construct();
		 }
		
		/*
		 * default entry point of the program
		 */
		public function index() {
			$param = 'home_page';
			$data['title'] = $param;
			$this->load->view('homePage/' . $param, $data);
		}
	}



//omitted closing php tag
