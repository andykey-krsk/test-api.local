<?php

class Product_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();

	}

	public function getProduct(){
		$query = $this->db->get('products');

		return $query->row_array();
	}
}
