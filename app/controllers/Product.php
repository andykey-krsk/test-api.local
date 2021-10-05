<?php

class Product extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('product_model');

	}

	public function index(){

		$products = $this->product_model->getProduct();

		print_r($products);

		$this->load->view('product/index');
	}

	public function show($id){
		$data['title'] = 'title';
		$data['id'] = $id;
		$this->load->view('product/show',$data);
	}

	public function group($name){
		$data['name'] = $name;
		$this->load->view('product/group', $data);
	}
}
