<?php
class ModelExtensionPaymentBankkvipay extends Model { 
public function getMethod($address, $total) {
		$this->load->language('extension/payment/bankkvi_pay');
		
		if ($total > 0) {
			$status = true;

			if ($this->config->get('bankkvi_pay_status')) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('bankkvi_pay_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

				if (!$this->config->get('bankkvi_pay_geo_zone_id')) {
					$status = TRUE;
					if ($this->config->get('bankkvi_pay_minpay')){
						if ($this->currency->format($total, $this->config->get('bankkvi_pay_minpay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_minpay_currency')), false) <= $this->config->get('bankkvi_pay_minpay')) {
							$status = false;
						}
					}
					if ($this->config->get('bankkvi_pay_maxpay')){
						if ($this->currency->format($total, $this->config->get('bankkvi_pay_maxpay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_maxpay_currency')), false) >= $this->config->get('bankkvi_pay_maxpay')) {
								$status = false;
							}
					}
				} elseif ($query->num_rows) {
					$status = TRUE;

					if ($this->config->get('bankkvi_pay_minpay')){
											if ($this->currency->format($total, $this->config->get('bankkvi_pay_minpay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_minpay_currency')), false) <= $this->config->get('bankkvi_pay_minpay')) {
												$status = false;
											}
										}
					if ($this->config->get('bankkvi_pay_maxpay')){
						if ($this->currency->format($total, $this->config->get('bankkvi_pay_maxpay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_maxpay_currency')), false) >= $this->config->get('bankkvi_pay_maxpay')) {
								$status = false;
							}
					}
				} else {
					$status = FALSE;
				}
			} else {
				$status = FALSE;
			}
			


		} else {
			$status = false;
		}
    
		$method_data = array();
		if ($status) {  
			if ($this->config->get('bankkvi_pay_name_attach')) {
				$metname = htmlspecialchars_decode($this->config->get('bankkvi_pay_name_' . $this->config->get('config_language_id')));
			}
			else{
				$metname = $this->language->get('text_title');
			}
			$method_data = array( 
				'code'       => 'bankkvi_pay',
				'title'      => $metname,
                'terms'      => '',
				'sort_order' => $this->config->get('bankkvi_pay_sort_order')
			);
		}
		
    	return $method_data;
  	}

    public function getForm($order_id, $style) { 
        $this->load->model('checkout/order');
        $this->load->language('extension/payment/bankkvi_pay');
        $order_info = $this->model_checkout_order->getOrder($order_id);
        $data['style'] = $style;
        $data['form_name'] = sprintf($this->language->get('form_name'), $order_info['order_id']);
        $data['form_platezh'] = $this->language->get('form_platezh');
        $data['form_kvi'] = $this->language->get('form_kvi');
        $data['form_poluch'] = $this->language->get('form_poluch');
        $data['form_bankinn'] = $this->language->get('form_bankinn');
        $data['form_v'] = $this->language->get('form_v');
        $data['form_bik'] = $this->language->get('form_bik');
        $data['form_ks'] = $this->language->get('form_ks');
        $data['form_plat'] = $this->language->get('form_plat');
        $data['form_invoi'] = $this->language->get('form_invoi');
        $data['form_platelshik'] = $this->language->get('form_platelshik');
        $data['form_adress'] = $this->language->get('form_adress');
        $data['form_inn'] = $this->language->get('form_inn');
        $data['form_lich'] = $this->language->get('form_lich');
        $data['form_summa'] = $this->language->get('form_summa');
        $data['form_banksumma'] = $this->language->get('form_banksumma');
        $data['form_podpis'] = $this->language->get('form_podpis');
        $data['form_date'] = $this->language->get('form_date');

        $data['order_id'] = $order_info['order_id'];
        $data['address']  = $order_info['payment_city'] . " " . $order_info['payment_address_1'] . " " . $order_info['payment_address_2'];
        $data['inn']      = nl2br($this->config->get('bankkvi_pay_inn_' . $this->config->get('config_language_id')));
        $data['bank']     = nl2br($this->config->get('bankkvi_pay_bank_' . $this->config->get('config_language_id')));
        $data['rs']       = nl2br($this->config->get('bankkvi_pay_rs_' . $this->config->get('config_language_id')));
        $data['bankuser'] = nl2br($this->config->get('bankkvi_pay_bankuser_' . $this->config->get('config_language_id')));
        $data['bik']      = nl2br($this->config->get('bankkvi_pay_bik_' . $this->config->get('config_language_id')));
        $data['ks']       = nl2br($this->config->get('bankkvi_pay_ks_' . $this->config->get('config_language_id')));
        if ($this->config->get('bankkvi_pay_currency') == 'SHOP'){
            $this->config->set('bankkvi_pay_currency', $order_info['currency_code']);
        }
        if ($this->config->get('bankkvi_pay_komis')){$proc=$this->config->get('bankkvi_pay_komis');}
          if ($this->config->get('bankkvi_pay_fixen')) {
                if ($this->config->get('bankkvi_pay_fixen') == 'fix'){
                    $out_summ = $this->config->get('bankkvi_pay_fixen_amount');
                }
                else{
                    $out_summ = $order_info['total'] * $this->config->get('bankkvi_pay_fixen_amount') / 100;
                }
          }
          else{
                $out_summ = $order_info['total'];
          }
          if (is_numeric($out_summ)){

        if ($this->currency->has($this->config->get('bankkvi_pay_currency'))){
          $totalrub = $out_summ;
          if (isset($proc)){$kvi_sum = $this->currency->format(($totalrub*$proc/100)+$totalrub, $this->config->get('bankkvi_pay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_currency')), false);}
          else{$kvi_sum = $this->currency->format($totalrub, $this->config->get('bankkvi_pay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_currency')), false);}
        }
        else{echo 'No currency '.$this->config->get('bankkvi_pay_currency'); exit();}
        }
        else{
            echo 'error: no total sum';
            exit();
        }
        
        $data['amount']   = intval($kvi_sum);
        $data['amount2']   = intval(round(floatval($kvi_sum)-intval($kvi_sum),2)*100);
        if ($data['amount2'] == 0) {
            $data['amount2'] = '00';
        }
        if ($this->config->get('bankkvi_pay_currency') == 'RUB' || $this->config->get('bankkvi_pay_currency') == 'RUR') {
            $data['syleft'] = '';
            $data['syright'] = ' '.$this->language->get('form_rub').' ';
            $data['sycop'] = ' '.$this->language->get('form_kop');
        }
        else{
            $data['syleft'] = $this->currency->getSymbolLeft($this->config->get('bankkvi_pay_currency'));
            $data['syright'] = '.';
            $data['sycop'] = '';
        }

        $data['name']     = $order_info['payment_firstname'] . " " . $order_info['payment_lastname'];
                    
        $whois = $this->config->get('bankkvi_pay_whois');
        if ($whois == 'whois_goradr'){
            $data['address'] = $order_info['payment_city'] . ", " . $order_info['payment_address_1'] . " " . $order_info['payment_address_2'];
        }

        if ($whois == 'whois_indoblgoradr'){
            if ($order_info['payment_zone'] == 'Москва'){
                $order_info['payment_zone'] = '';
            }
            else{
                $order_info['payment_zone'] = $order_info['payment_zone'] . ', ';
            }
            if ($order_info['payment_postcode']){
                $order_info['payment_postcode'] =  $order_info['payment_postcode'] . ', ';
            }
            else{
                $order_info['payment_postcode'] =  '';
            }
                $data['address'] = $order_info['payment_postcode'] . $order_info['payment_zone'] . $order_info['payment_city'] . ", " . $order_info['payment_address_1'] . " " . $order_info['payment_address_2'];
        }

        if ($whois == 'whois_custom'){
            $data['address'] = $this->getCustomFields($order_info, $this->config->get('bankkvi_pay_whois_custom_' . $this->config->get('config_language_id')));;
        }

            $invoice = $this->config->get('bankkvi_pay_invoi');
            if ($invoice == 'invoi_zakaz'){
                $data['invoi'] = $this->language->get('form_invoi') . $order_info['order_id'];
            }
            if ($invoice == 'invoi_zakazdc'){
                $data['invoi'] = $this->language->get('form_invoi') . $order_info['order_id'] . ' от ' . date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
            }
            if ($invoice == 'invoi_zakazd'){
                $data['invoi'] = $this->language->get('form_invoi') . $order_info['order_id'] . ' от ' . date($this->language->get('date_format_short'), strtotime($order_info['date_modified']));
            }

            if ($invoice == 'invoi_custom'){
            $data['invoi'] = $this->getCustomFields($order_info, $this->config->get('bankkvi_pay_invoi_custom_' . $this->config->get('config_language_id')));;
            }
                    




        //$data['invoi'] = sprintf($this->language->get('form_invoi'), $order_info['order_id']);


        
        $html = $this->load->view('extension/payment/bankkvi_pay_form', $data);
        

        return $html;

    }

  	public function getCustomFields($order_info, $varabliesd) {
            $instros = explode('~', $varabliesd);
            $instroz = "";

            if ($this->config->get('bankkvi_pay_currency') == 'SHOP'){
                $this->config->set('bankkvi_pay_currency', $order_info['currency_code']);
            }

            if ($this->config->get('bankkvi_pay_fixen')) {
                if ($this->config->get('bankkvi_pay_fixen') == 'fix'){
                    $out_summ = $this->config->get('bankkvi_pay_fixen_amount');
                }
                else{
                    $out_summ = $order_info['total'] * $this->config->get('bankkvi_pay_fixen_amount') / 100;
                }
            }
            else{
                $out_summ = $order_info['total'];
            }

            foreach ($instros as $instro) {
                if ($instro == 'checkouthref' || $instro == 'href' || $instro == 'hrefdwnld' || $instro == 'hrefprint' || $instro == 'orderid' || $instro == 'card4num' ||  $instro == 'itogo' ||  $instro == 'itogobez' ||  $instro == 'itogozakaz' || $instro == 'komis' || $instro == 'total-komis' || $instro == 'plus-komis' || $instro == 'totals' || $instro == 'nds' || $instro == 'bvnds' || isset($order_info[$instro]) || substr_count($instro, "ordercustom_") || substr_count($instro, "shippingAddresscustom_") || substr_count($instro, "paymentAddresscustom_") || substr_count($instro, "customercustom_") || substr_count($instro, "paymentsimple4_") || substr_count($instro, "shippingsimple4_") || substr_count($instro, "simple4_")){
                    if ($instro == 'checkouthref'){
                        if (!$this->config->get('bankkvi_pay_securelink')){
                            $instro_other = $order_info['store_url'] . 'index.php?route=checkout/success_bankkvi_pay&code=' . $this->getSecureCode($order_info['order_id']) . '&order='.$order_info['order_id'];
                        }
                        else{
                            $instro_other = $order_info['store_url'] . 'index.php?route=checkout/success_bankkvi_pay&order='.$order_info['order_id'];
                        }
                    }
                    if ($instro == 'href'){
                        if (!$this->config->get('bankkvi_pay_securelink')){
                            $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/bankkvi_pay/view&code=' . $this->getSecureCode($order_info['order_id']) . '&order='.$order_info['order_id'];
                        }
                        else{
                            $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/bankkvi_pay/view&order='.$order_info['order_id'];
                        }
                    }
                    if ($instro == 'hrefdwnld'){
                        if (!$this->config->get('bankkvi_pay_securelink')){
                            $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/bankkvi_pay/dwnld&code=' . $this->getSecureCode($order_info['order_id']) . '&order='.$order_info['order_id'];
                        }
                        else{
                            $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/bankkvi_pay/dwnld&order='.$order_info['order_id'];
                        }
                    }
                    if ($instro == 'hrefprint'){
                        if (!$this->config->get('bankkvi_pay_securelink')){
                            $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/bankkvi_pay/printer&code=' . $this->getSecureCode($order_info['order_id']) . '&order='.$order_info['order_id'];
                        }
                        else{
                            $instro_other = $order_info['store_url'] . 'index.php?route=extension/payment/bankkvi_pay/printer&order='.$order_info['order_id'];
                        }
                    }
                    if ($instro == 'orderid'){
                        $instro_other = $order_info['order_id'];
                    }
                    if ($instro == 'itogo'){
                        $instro_other = $this->currency->format($out_summ, $this->config->get('bankkvi_pay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_currency')), true);
                    }
                    if ($instro == 'itogobez'){
                        $instro_other = $this->currency->format($out_summ, $this->config->get('bankkvi_pay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_currency')), false);
                    }
                    if ($instro == 'itogozakaz'){
                        $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false);
                    }
                    if ($instro == 'komis'){
                        if($this->config->get('bankkvi_pay_komis')){
                            $instro_other = $this->config->get('bankkvi_pay_komis') . '%';
                        }
                        else{$instro_other = '';}
                    }
                    if ($instro == 'total-komis'){
                        if($this->config->get('bankkvi_pay_komis')){
                            $instro_other = $this->currency->format($out_summ * $this->config->get('bankkvi_pay_komis')/100,  $this->config->get('bankkvi_pay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_currency')), true);
                        }
                        else{$instro_other = '';}
                    }
                    if ($instro == 'plus-komis'){
                        if($this->config->get('bankkvi_pay_komis')){
                            $instro_other = $this->currency->format($out_summ + ($out_summ * $this->config->get('bankkvi_pay_komis')/100),  $this->config->get('bankkvi_pay_currency'), $this->currency->getValue($this->config->get('bankkvi_pay_currency')), true);
                        }
                        else{$instro_other = '';}
                    }
                    if ($instro == 'totals'){
                        $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], true);
                    }
                    if ($instro == 'nds'){
                        $this->load->model('account/order');
                        $totals = $this->model_account_order->getOrderTotals($order_info['order_id']);
                        $taxesnds = '';
                        $ndschislo = '';
                        $ndschislo2 = '';
                          foreach ($totals as $total){
                            if($total['code'] == 'tax'){
                                $taxes = true;
                                $taxesnds += $total['value'];
                            }
                        }
                        if ($this->config->get('cash_plusplus_prends') == 'all'){
			            	$ndschislo = number_format(floatval(ltrim(preg_replace('/[^0-9.]/', '', str_replace(" ","", $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], false)/118*18)), " .")), 2, '.', ' ');
			            }
			            if ($this->config->get('cash_plusplus_prends') == 'prod'){
			            	$products = $this->model_account_order->getOrderProducts($order_info['order_id']);
					        $ndstaxes ='';
					        foreach ($products as $product) {
					        	$ndstaxes += $product['total'];
					        }

			            	$ndschislo2 = number_format(floatval(ltrim(preg_replace('/[^0-9.]/', '', str_replace(" ","", $ndstaxes/118*18)), " .")), 2, '.', ' ');
			            	
			            }
                        $instro_other = $this->currency->format($taxesnds, $order_info['currency_code'], $order_info['currency_value'], false) + $ndschislo + $ndschislo2;
                    }
                    
                    if(isset($order_info[$instro])){
                        $instro_other = $order_info[$instro];
                    }

                    if (substr_count($instro, "ordercustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'order');
                        $customx = $this->model_tool_simplecustom->getOrderField($order_info['order_id'], $instro);
                        if ($customx){
                             $instro_other = $customx;
                        }
                        
                    }
                    if (substr_count($instro, "shippingAddresscustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'shippingAddress');
                        $customx = $this->model_tool_simplecustom->getShippingAddressField($order_info['order_id'], $instro);
                        if ($customx){
                            $instro_other = $customx;
                        }
                    }
                    if (substr_count($instro, "paymentAddresscustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'shippingAddress');
                        $customx = $this->model_tool_simplecustom->getPaymentAddressField($order_info['order_id'], $instro);
                        if ($customx){
                            $instro_other = $customx;
                        }
                    }
                    if (substr_count($instro, "customercustom_")){
                        $this->load->model('tool/simplecustom');
                        $instro = ltrim($instro, 'customer');
                        $customx = $this->model_tool_simplecustom->getCustomerField($order_info['customer_id'], $instro);
                        if ($customx){
                            $instro_other = $customx;
                        }
                    }

                    if (substr_count($instro, "paymentsimple4_") ){
                        $this->load->model('tool/simplecustom');
                        $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                        $pole = ltrim($instro, 'paymentsimple4');
                        $pole = substr($pole, 1);
                        if (array_key_exists($pole , $customx) == true){
                        $instro_other = $customx[$pole];
                        }
                        if (array_key_exists('payment_' . $pole , $customx) == true){
                          $instro_other = $customx['payment_' . $pole];
                        }
                    }
                    if (substr_count($instro, "shippingsimple4_") ){
                        $this->load->model('tool/simplecustom');
                        $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                        $pole = ltrim($instro, 'shippingsimple4');
                        $pole = substr($pole, 1);
                        if (array_key_exists($pole , $customx) == true){
                        $instro_other = $customx[$pole];
                        }
                        if (array_key_exists('shipping_' . $pole , $customx) == true){
                          $instro_other = $customx['shipping_' . $pole];
                        }
                    }
                    if (substr_count($instro, "simple4_") ){
                        $this->load->model('tool/simplecustom');
                        $customx = $this->model_tool_simplecustom->getCustomFields('order', $order_info['order_id']);
                        $pole = ltrim($instro, 'simple4');
                        $pole = substr($pole, 1);
                        if (array_key_exists($pole , $customx) == true){
                        $instro_other = $customx[$pole];
                        }
                    }
                    
                }
                else {
                    $instro_other = nl2br(htmlspecialchars_decode($instro));
                }
                    $instroz .=  $instro_other;
            }
            return $instroz;
    }

    public function getOrderStatus($order_status_id) {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
            
            return $query->row;
    }

    public function getSecureCode($order_id) {
        $code = substr(md5($order_id . $this->config->get('config_encryption')), 0, 12);
        return $code;
    }

}
?>