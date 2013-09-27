<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Student {
	
	//student data -- initially null
	protected $idNum = null;
	protected $name = null;
	protected $username = null;
	protected $collegein = null;
	protected $coursein = null;
	protected $year = null;
	
	//constructor
	public function __construct($params) {
		//get codeigniter's instance
		$CI = &get_instance();
		$CI->load->model('student_model', 'student');
		//set id number
		$this->idNum = $params['id'];
		$bio = $CI->student->getStudent($this->idNum);
		if($bio != false) {
			//set attributes
			$bioRow = $bio->row();
			$this->name = $bioRow->fname . ' ' . $bioRow->minit . '. ' . $bioRow->lname;
			$this->username = $bioRow->username;
			$this->year = $bioRow->year;
		}
		$skul = $CI->student->getStudentCourseAndCollege($this->idNum);
		if($skul != false) {
			//set attributes
			$skulRow = $skul->row();
			$this->collegein = $skulRow->college;
			$this->coursein = $skulRow->course;
		}
	}
	
	//get the record of the current instance student
	public function getEventRecord() {
		
	}

	/*
	 * getter functions
	*/
	
	public function getIdNum() {
		return $this->idNum;
	}
	
	public function getName() {
		return $this->name;
	}
	
	public function getUsername() {
		return $this->username;
	}
	
	public function getCollegein() {
		return $this->collegin;
	}
	
	public function getCoursein() {
		return $this->coursein;
	}
	
	public function getYear() {
		return $year;
	}
	
	/*
	 * setter functions
	 */
	 
	 public function setIdNum($newId) {
		 $this->idNum = $newId;
	 }
	 
	 public function setName($newName) {
		 $this->name = $newName;
	 }
	 
	 public function setUsername($newUsername) {
		 $this->username = $newUsername;
	 }
	 
	 public function setCollegein($newCollegein) {
		 $this->collegein = $newCollegein;
	 }
	 
	 public function setCoursein($newCoursein) {
		 $this->coursein = $newCoursein;
	 }
	 
	 public function setYear($newYear) {
		 $this->year = $newYear;
	 }
	 
}

/* End of file */
