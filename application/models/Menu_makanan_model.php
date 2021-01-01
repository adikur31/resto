<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Menu_makanan_model extends CI_Model {

		public function getAllMenu()
	{
		return $this->db->get('menu_makanan')->result_array();
	}

	public function getMenu($id)
	{
		return $this->db->get_where('menu', ['id_menu' => $id])->row_array();
	}

	public function create($data)
	{
		$this->db->insert('menu', $data);
	}

	public function update($id, $data)
	{
		$this->db->where('id_menu', $id);
		$this->db->update('menu', $data);
	}

	public function delete($id)
	{
		$this->db->where('id_menu', $id);
		$this->db->delete('menu');
	}

	public function getMenuParent()
	{
		return $this->db->get_where('menu', ['id_parent' => null])->result_array();
	}
	

}

/* End of file Menu_makanan_model.php */
/* Location: ./application/models/Menu_makanan_model.php */