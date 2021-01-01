<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('Auth_model');
		$this->load->model('User_model');
		$this->load->model('Detail_role_model');
		$this->load->model('Data_restoran_model');
	}

	public function index()
	{
		$this->load->view('auth/login');
		
	}
	public function login()
	{
		$this->form_validation->set_rules('username', 'Username', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Login';		
			$this->load->view('auth/login', $data);			
		} else {
			$username = htmlspecialchars($this->input->post('username', true));
			$password = $this->input->post('password', true);

			// $user = $this->db->get_where('user', ['username' => $username])->row_array();
			$user = $this->Auth_model->checkLogin($username);
			if ($user) {
				if (password_verify($password, $user[0]['password'])) {
					if (count($user) > 1) {
						$this->session->set_userdata($data);$data = [
							'username'		=> $user[0]['username'],
							'id_restoran'	=> $user[0]['id_restoran'],
						];
						$this->session->set_userdata($data);
						redirect('pilihrole');
					}else{
						$data = [
							'username'		=> $user[0]['username'],
							'id_role'		=> $user[0]['id_role'],
							'id_restoran'	=> $user[0]['id_restoran'],
						];
						$this->session->set_userdata($data);

						if ($user[0]['id_role'] == 1) {
							redirect('/admin/dashboard');
						} else if ($user[0]['id_role'] == 2) {
							redirect('/kasir/dashboard');
						} else if ($user[0]['id_role'] == 3) {
							redirect('/waiter/dashboard');
						}
					}
					
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password salah</div>');	
					redirect('Auth/login');
				}
				
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Akun tidak terdaftar</div>');	
				redirect('Auth/login');
			}
			
		}
	}
	public function register()
	{	
		$this->form_validation->set_rules('nama', 'Nama', 'trim|required');
		$this->form_validation->set_rules('username', 'Username', 'required|is_unique[user.username]');
		$this->form_validation->set_rules('password1', 'Password', 'required|trim|min_length[6]|matches[password2]', [
			'matches'		=> 'Password not match',
			'min_length'	=> 'Password min 6 char'
		]);
		$this->form_validation->set_rules('password2', 'Password', 'required|trim|matches[password1]');
		$this->form_validation->set_rules('nama_restoran', 'Nama Restoran', 'trim|required');
		$this->form_validation->set_rules('alamat_restoran', 'Alamat Restoran', 'trim|required');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Register';		
			$this->load->view('auth/register', $data);						
		} else {
			$data_resto = [
				'nama_resto'		=> htmlspecialchars($this->input->post('nama_restoran', true)),
				'alamat_resto'		=> htmlspecialchars($this->input->post('alamat_restoran', true)),
			];
			$id_resto_insert = $this->Data_restoran_model->create($data_resto);

			$data = [
				'nama'			=> htmlspecialchars($this->input->post('nama', true)),
				'username'		=> htmlspecialchars($this->input->post('username', true)),
				'password'		=> password_hash($this->input->post('password1'), PASSWORD_DEFAULT),
				'id_restoran'	=> $id_resto_insert, 
				'foto'			=> 'default.jpg',
			];
			$id_user_insert = $this->User_model->create($data);
			
			$data_detail = [
				'id_user' => $id_user_insert,
				'id_role' => 1,
			];
			$this->Detail_role_model->create($data_detail);

			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil mendaftar. Silahkan login</div>');
			redirect('auth');
		}	
	}

	public function logout()
	{
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('id_role');

		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Logout</div>');
		redirect('Auth/login');
	}

}

/* End of file Auth.php */
/* Location: ./application/controllers/Auth.php */