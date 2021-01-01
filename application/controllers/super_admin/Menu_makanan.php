<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu_makanan extends CI_Controller {

	public function __construct()
	{
		parent::__construct();

		if (!$this->session->userdata('username') && $this->session->userdata('id_role') != 1){
			redirect('auth/login');
		}
		$this->load->model('Menu_makanan_model');
		$this->load->model('User_model');
		$this->load->model('Role_model');
		$this->load->model('Detail_role_model');
		$this->load->library('form_validation');

	}

	public function index()
	{
		$data['title'] = 'Data Makanan';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['menu_makanan'] = $this->Menu_makanan_model->getallmenu();
		
		$this->load->view('admin/menu_makanan/index', $data);
	}

		public function create()
	{
		$data['title'] = 'Data Makanan';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['role'] = $this->Role_model->getAllRole();

		$this->form_validation->set_rules('nama_makanan', 'Nama Makanan', 'trim|required');
		$this->form_validation->set_rules('username', 'Username', 'required|is_unique[user.username]');
		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[6]|matches[password2]', [
			'matches'		=> 'Password not match',
			'min_length'	=> 'Password min 6 char'
		]);
		$this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');
		$this->form_validation->set_rules('role[]', 'Role', 'required|trim');


		if ($this->form_validation->run() == false) {						
			$this->load->view('admin/menu_makanan/add', $data);
		} else {
			$upload_image = $_FILES['foto']['name'];
			if ($upload_image) {
				$config['upload_path'] = './assets/img/profile/';
				$config['allowed_types'] = 'gif|jpg|png';
				$config['max_size']     = '2048';
				$this->load->library('upload', $config);

				if ($this->upload->do_upload('foto')) {
					$data = [
						'nama'			=> $this->input->post('nama', true),
						'username'		=> $this->input->post('username', true),
						'password'		=> password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
						'foto'			=> $this->upload->data('file_name'),
						// 'role'			=> $this->input->post('role', true),
					];
				} else {
					$error = $this->upload->display_errors();
					$this->session->set_flashdata('message', $error);
					redirect('admin/menu_makanan/add');
				}
				
			}else{
				$data = [
					'nama'			=> $this->input->post('nama', true),
					'username'		=> $this->input->post('username', true),
					'password'		=> password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
					'foto'			=> 'default.jpg',
					// 'role'			=> $this->input->post('role', true),
				];
			}
			
			$id_user_insert = $this->User_model->create($data);
			$role = $this->input->post('role', true);
			foreach ($role as $key) {
				$data_detail = [
					'id_user' => $id_user_insert,
					'id_role' => $key,
				];
				$this->Detail_role_model->create($data_detail);
			}

			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Simpan</div>');
			redirect('admin/menu_makanan');
		}

	}

	

}

/* End of file Menu_makanan.php */
/* Location: ./application/controllers/admin/Menu_makanan.php */