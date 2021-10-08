<?php

class Product_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();
	}

	public function getAll(){
		$this->db->select('product_id, product_name');
		$query = $this->db->get('products');
		return $query->result_array();
	}

	public function getOne($id){
		$query = $this->db->get_where('products',array('product_id'=>$id));
		return $query->row_array();
	}

	public function getImg($id){
		$this->db->select('img_id, img_small, img_full');
		$query = $this->db->get_where('img',array('product_id'=>$id));
		return $query->result_array();
	}

	public function getGroup($name){
		$this->db->select('product_id, product_name');
		$query = $this->db->get_where('products',array('group'=>$name));
		return $query->result_array();
	}

}
