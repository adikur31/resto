<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Auth_super extends CI_Model {

	public function checkLogin($username)
	{
		$this->db->select('*');
		$this->db->from('data_super_admin');
		$this->db->where('data_super_admin.username', $username);
		return $this->db->get()->result_array();
	}	

}

/* End of file Auth_model.php */
/* Location: ./application/models/Auth_model.php */