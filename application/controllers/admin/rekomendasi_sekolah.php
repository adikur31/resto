<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Rekomendasi_sekolah extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('User_model');
		$this->load->model('Sekolah_model');
		$this->load->model('Kriteria_model');
		$this->load->model('Rekomendasi_sekolah_model');
	}

	public function index()
	{
		$data['title'] = 'Rekomendasi Sekolah';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['sekolah'] = $this->Sekolah_model->getAllSekolah();

		$this->load->view('admin/rekomendasi_sekolah/index', $data);		
	}


}