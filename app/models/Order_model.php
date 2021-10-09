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

	public function getUser($id){
		$query = $this->db->get_where('users',array('user_id'=>$id));
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

		return $this->getOrder($id);
	}

	public function createOrder($data){
		$order['user_id'] = $data['user_id'];
		$order['coment'] = $data['coment'];
		$this->db->select_max('number', 'max_number');
		$query = $this->db->get('orders');

		$order['number'] = $query->row_array()['max_number'] + 1;

		//создаем заказ
		$this->db->insert('orders', $order);
		$order_id = (string)$this->db->insert_id();

		//добабавляем продукты в заказ
		$product = $data['product'];
		foreach ($product as &$item) {
			$item['order_id'] = $order_id;
		}
		unset($item);

		$this->db->insert_batch('order_product', $product);
		return $order_id;
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
