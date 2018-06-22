<?php
class ControllerExtensionPaymentBankkvipay extends Controller {
	public function index() {

      $this->load->model('checkout/order');
      $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
      $this->load->model('extension/payment/bankkvi_pay');
      $this->language->load('extension/payment/bankkvi_pay');

		  $data['instructionat'] = $this->config->get('bankkvi_pay_instruction_attach');
    	$data['button_confirm'] = $this->language->get('button_confirm');
      if ($this->config->get('bankkvi_pay_instruction_attach')){
        $data['text_instruction'] = $this->language->get('text_instruction');
        $data['bank'] = htmlspecialchars_decode($this->model_extension_payment_bankkvi_pay->getCustomFields($order_info, $this->config->get('bankkvi_pay_instruction_' . $this->config->get('config_language_id'))));
      }

      if ($this->config->get('bankkvi_pay_success_page')){
        $data['continue'] = $this->url->link('checkout/success');
      }
      else{ 
        $data['continue'] = $this->model_extension_payment_bankkvi_pay->getCustomFields($order_info, '~checkouthref~');
      }
		return $this->load->view('extension/payment/bankkvi_pay', $data);
	}
	
	public function confirm() {
    if ($this->session->data['payment_method']['code'] == 'bankkvi_pay') {
      $this->load->model('checkout/order');
      $order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
      $this->language->load('extension/payment/bankkvi_pay');
      $this->load->model('extension/payment/bankkvi_pay');
      if ($this->config->get('bankkvi_pay_mail_instruction_attach')){
    	 $comment = $this->model_extension_payment_bankkvi_pay->getCustomFields($order_info, $this->config->get('bankkvi_pay_mail_instruction_' . $this->config->get('config_language_id')));
      }
      else {
        $comment = '';
      }
      
    	$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('bankkvi_pay_start_order_status_id'), $comment, true);
    	
    }
  }

  public function view() {
    if (isset($this->request->get['order'])) {

      $this->load->model('checkout/order');
      $order_info = $this->model_checkout_order->getOrder($this->request->get['order']);

      $this->load->model('extension/payment/bankkvi_pay');

      if (!$this->config->get('bankkvi_pay_securelink')){
        if (!isset($this->request->get['code'])) {
          $this->response->redirect($this->url->link('error/not_found'));
        }
        $platp = $this->model_extension_payment_bankkvi_pay->getSecureCode($order_info['order_id']);
        if ($this->request->get['code'] != $platp) {
          $this->response->redirect($this->url->link('error/not_found'));
        }
      }

      echo $this->model_extension_payment_bankkvi_pay->getForm($order_info['order_id'], 'html');
    }
    else{
      $this->response->redirect($this->url->link('error/not_found'));
    }
  }

  public function dwnld() {
    if (isset($this->request->get['order'])) {

      $this->load->model('checkout/order');
      $order_info = $this->model_checkout_order->getOrder($this->request->get['order']);

      $this->load->model('extension/payment/bankkvi_pay');

      if (!$this->config->get('bankkvi_pay_securelink')){
        if (!isset($this->request->get['code'])) {
          $this->response->redirect($this->url->link('error/not_found'));
        }
        $platp = $this->model_extension_payment_bankkvi_pay->getSecureCode($order_info['order_id']);
        if ($this->request->get['code'] != $platp) {
          $this->response->redirect($this->url->link('error/not_found'));
        }
      }

      $html = $this->model_extension_payment_bankkvi_pay->getForm($order_info['order_id'], 'pdf');

      require_once(DIR_SYSTEM . 'extra/dompdf/dompdf_config.inc.php');
                    $dompdf = new DOMPDF();
                    $dompdf->load_html($html);
                    $dompdf->render();
                    $dompdf->stream("bank_extension_payment_" . $this->request->get['order'] . ".pdf");

      
    }
    else{
      $this->response->redirect($this->url->link('error/not_found'));
    }
  }

  public function printer() {
    if (isset($this->request->get['order'])) {

      $this->load->model('checkout/order');
      $order_info = $this->model_checkout_order->getOrder($this->request->get['order']);

      $this->load->model('extension/payment/bankkvi_pay');

      if (!$this->config->get('bankkvi_pay_securelink')){
        if (!isset($this->request->get['code'])) {
          $this->response->redirect($this->url->link('error/not_found'));
        }
        $platp = $this->model_extension_payment_bankkvi_pay->getSecureCode($order_info['order_id']);
        if ($this->request->get['code'] != $platp) {
          $this->response->redirect($this->url->link('error/not_found'));
        }
      }

      echo $this->model_extension_payment_bankkvi_pay->getForm($order_info['order_id'], 'printer');
    }
    else{
      $this->response->redirect($this->url->link('error/not_found'));
    }
  }

}
?>