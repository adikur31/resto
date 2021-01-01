<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth_super_admin extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_validation');
		$this->load->model('Auth_super');
		$this->load->model('User_model');
		$this->load->model('Detail_role_model');
	}

	public function index()
	{
		$this->load->view('auth/login_super');
		
	}
	public function login()
	{
		$this->form_validation->set_rules('username', 'Username', 'trim|required');
		$this->form_validation->set_rules('password', 'Password', 'trim|required');

		if ($this->form_validation->run() == false) {
			$data['title'] = 'Login';		
			$this->load->view('auth/login_super', $data);			
		} else {
			$username = htmlspecialchars($this->input->post('username', true));
			$password = $this->input->post('password', true);

			// $user = $this->db->get_where('user', ['username' => $username])->row_array();
			$user = $this->Auth_super->checkLogin($username);
			if ($user) {
				if (password_verify($password, $user[0]['password'])) {
					if (count($user) > 1) {
						$this->session->set_userdata($data);$data = [
							'username'	=> $user[0]['username'],
						];
				
					}else{
						$data = [
							'username'	=> $user[0]['username'],
						];
						$this->session->set_userdata($data);
						// if ($user[0]['id_role'] == 1) {
							redirect('/super_admin/Dashboard');
						// } else {
						// 	echo "halaman user";
						// 	// redirect('user');
						// }
					}	
				} else {
					$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Password salah</div>');	
					redirect('Auth_super_admin/login');
				}
				
			} else {
				$this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Akun tidak terdaftar</div>');	
				redirect('Auth_super_admin/login');
			}
			
		}
	}


	public function logout()
	{
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('id_role');

		$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Berhasil Logout</div>');
		redirect('Auth_super_admin/login');
	}

}

/* End of file Auth.php */
/* Location: ./application/controllers/Auth.php */