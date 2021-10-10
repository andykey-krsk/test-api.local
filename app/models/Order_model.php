<?php

class Order_model extends CI_Model
{
	public function __construct()
	{
		$this->load->database();
	}

	public function getOrder($id){
		return $this->db
			->get_where('orders',array('order_id'=>$id))
			->row_array();
	}

	public function getUser($id){
		return $this->db
			->get_where('users',array('user_id'=>$id))
			->row_array();
	}

	public function getProductByOrder($id){
		return $this->db
			->select('p.product_id, p.product_name, p.product_price, o.product_id, quantity')
			->from('products as p')
			->join('order_product as o','p.product_id = o.product_id')
			->where('o.order_id', $id)
			->get()
			->result_array();
	}

	public function setOrderCancel($id){
		$this->db
			->where('order_id', $id)
			->update('orders', array('status'=>'отменен'));
	}

	public function createOrder($data){
		$order['user_id'] = $data['user_id'];
		$order['coment'] = $data['coment'];
		$order['number'] = $this->db
				->select_max('number', 'max_number')
				->get('orders')
				->row_array()['max_number'] + 1;

		//создаем заказ
		$this->db->insert('orders', $order);
		$order_id = $this->db->insert_id();

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
		return $this->db
			->get_where('users',array('user_id'=>$id))
			->row_array();
	}

	public function checkProduct($id)
	{
		return $this->db
			->get_where('products',array('product_id'=>$id))
			->row_array();
	}
}
