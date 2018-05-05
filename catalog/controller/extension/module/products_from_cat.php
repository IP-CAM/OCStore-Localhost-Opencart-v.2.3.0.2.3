<?php 
class ControllerExtensionModuleProductsFromCat extends Controller {

	public function index($setting) {

		$this->language->load('extension/module/products_from_cat');
		
		$this->load->model('catalog/product');

		$this->load->model('tool/image');
		
		$this->load->model('extension/module/products_from_cat');

		$data['heading_title'] = $this->language->get('heading_title_personal');
		
		$limit = html_entity_decode($setting['limit']);
		
		//next lines decommented by Zuev
		//$link = html_entity_decode($setting['link']);

		if(count($setting['categories']) == 1){
				$data['link'] = $this->url->link('product/category', 'path=' . $setting['categories'][0]);
				//echo $data['link'];
				//echo $setting['categories'][0];
		} else {
			$data['link'] = '#';
		}

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');
		$data['heading_title'] = $setting['title'];

		$data['products'] = array();

		$results = $this->model_extension_module_products_from_cat->getProducts($setting);

		foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price'], $this->session->data['currency']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
					// 'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'tax'         => $tax,
					'rating'      => $rating,
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id'])
				);
		}

		return $this->load->view('extension/module/products_from_cat', $data);

	}
}
?>