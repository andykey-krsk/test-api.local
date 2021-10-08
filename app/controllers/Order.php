<?php

class Order extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('order_model');
	}

	public function show($id){
		$order = $this->order_model->getOrder($id);

		if(empty($order)){
			show_404();
		}

		$order['product'] = $this->order_model->getProductByOrder($id);

		header('Content-type: json/application');
		echo json_encode($order);
	}

	public function create(){
		$data = json_decode(file_get_contents('php://input'), true);

		//проверка наличия юзера
		$user = $this->order_model->checkUser($data['user_id']);

		if(empty($user)){
			die('не правильный юзер');
		}

		//проверка наличия товара
		foreach ($data['product'] as $value){
			$product = $this->order_model->checkProduct($value['product_id']);
			if(empty($product)){
				die('товар с ид: ' . $value['product_id'] . ' отсутствует в каталоге');
			}
		}

		$order = $this->order_model->createOrder($data);

		if(empty($order)){
			die('Ошибка создания заказа');;
		}

		header('Content-type: json/application');
		echo json_encode($order);
	}

	public function cancel($id){
		$order = $this->order_model->setOrderCancel($id);

		if(empty($order)){
			show_404();
		}

		header('Content-type: json/application');
		echo json_encode($order);
	}
}
