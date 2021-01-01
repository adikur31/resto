<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		if (!$this->session->userdata('username') && $this->session->userdata('id_role') != 1) {
			redirect('auth_super_admin');
		}
		$this->load->model('Auth_super');
		$this->load->model('Dashboard_model');
	}

	public function index()
	{
		$data['title'] = "Dashboard";	
		$data['auth_super'] = $this->Auth_super->checklogin($this->session->userdata('username'));
		$data['user_total'] = $this->Dashboard_model->totalUser();
		$data['kriteria_total'] = $this->Dashboard_model->totalKriteria();
		$data['sekolah_total'] = $this->Dashboard_model->totalSekolah();

		$this->load->view('super_admin/dashboard/index', $data);	
	}

}

/* End of file Dashboard.php */
/* Location: ./application/controllers/Dashboard.php */