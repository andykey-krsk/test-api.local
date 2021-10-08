<?php

class Product extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('product_model');
	}

	public function index(){
		$products = $this->product_model->getAll();
		header('Content-type: json/application');
		echo json_encode($products);
	}

	public function show($id){
		$product = $this->product_model->getOne($id);

		if(empty($product)){
			show_404();
		}

		$product['img'] = $this->product_model->getImg($id);

		header('Content-type: json/application');
		echo json_encode($product);
	}

	public function group($name){
		$products = $this->product_model->getGroup($name);

		if(empty($products)){
			show_404();
		}

		header('Content-type: json/application');
		echo json_encode($products);
	}
}
