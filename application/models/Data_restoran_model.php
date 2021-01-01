<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_restoran_model extends CI_Model {

	public function create($data)
	{
		$this->db->insert('data_restoran', $data);
		return $this->db->insert_id();
	}

	public function update($id, $data)
	{
		$this->db->where('id_restoran', $id);
		$this->db->update('data_restoran', $data);
	}

	public function delete($id)
	{
		$this->db->where('id_restoran', $id);
		$this->db->delete('data_restoran');
	}

}

/* End of file Data_restoran_model.php */
/* Location: ./application/models/Data_restoran_model.php */