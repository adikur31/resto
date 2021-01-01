<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Restoran extends CI_Controller {

	public function index()
	{
		$data['title'] = 'Profile Restoran';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));	
		$data['detail_role'] = $this->Detail_role_model->getDetailRoleUser($data['user']['id_user']);
		$this->load->view('admin/profile/index', $data);
	}

	public function update($id)
	{
		$data['title'] = 'Data Kriteria';
		$data['user'] = $this->User_model->getUserWithUsername($this->session->userdata('username'));
		$data['kriteria_data'] = $this->Kriteria_model->getKriteria($id);						

		$this->form_validation->set_rules('kriteria', 'Kriteria', 'trim|required');

		if ($this->form_validation->run() == false) {						
			$this->load->view('admin/kriteria/edit', $data);
		} else {
			$data = [
				'nama_kriteria'			=> $this->input->post('kriteria', true),
			];
			$this->Kriteria_model->update($id, $data);
			$this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil di Update</div>');
			redirect('admin/kriteria');
		}

	}

}

/* End of file Restoran.php */
/* Location: ./application/controllers/admin/Restoran.php */