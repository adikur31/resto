<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function index()
	{
		$this->load->view('auth/home');
	}

}

/* End of file home.php */
/* Location: ./application/controllers/home.php */