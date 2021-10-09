<?php

class Product_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();
	}

	public function getAll(){
		return $this->db
			->select('product_id, product_name')
			->get('products')
			->result_array();
	}

	public function getOne($id){
		return $this->db
			->get_where('products',array('product_id'=>$id))
			->row_array();
	}

	public function getImg($id){
		return $this->db->select('img_id, img_small, img_full')
			->get_where('img',array('product_id'=>$id))
			->result_array();
	}

	public function getGroup($name){
		return $this->db->select('product_id, product_name')
			->get_where('products',array('group'=>$name))
			->result_array();
	}
}
