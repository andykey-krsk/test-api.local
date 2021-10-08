<?php

class Order_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();
	}

	public function getOrder($id){
		$query = $this->db->get_where('orders',array('order_id'=>$id));
		return $query->row_array();
	}

	public function getProductByOrder($id){
		$this->db->select('p.product_id, p.product_name, p.product_price, o.product_id, quantity');
		$this->db->from('products as p');
		$this->db->join('order_product as o','p.product_id = o.product_id');
		$this->db->where('o.order_id', $id);
		$query = $this->db->get();
		return $query->result_array();
	}

	public function setOrderCancel($id){
		$data = array('status'=>'отменен');
		$this->db->where('order_id', $id);
		$this->db->update('orders', $data);

		$query = $this->db->get_where('orders',array('order_id'=>$id));
		return $query->row_array();
	}

	public function createOrder($data){
		var_dump($data);

		//$this->db->insert('orders', $data);

		//$this->db->insert('order_product', $data);

		//$query = $this->db->get_where('orders',array('order_id'=>$id));
		//return $query->row_array();
	}

	public function checkUser($id){
		$query = $this->db->get_where('users',array('user_id'=>$id));
		return $query->row_array();
	}

	public function checkProduct($id)
	{
		$query = $this->db->get_where('products',array('product_id'=>$id));
		return $query->row_array();
	}
}
