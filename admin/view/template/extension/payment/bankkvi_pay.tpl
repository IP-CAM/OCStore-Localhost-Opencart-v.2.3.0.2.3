<?php echo $header; ?>
<style type="text/css">
.error{
	color: red;
}
</style>><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-cod" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button> 
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i></h3>
      </div>
      <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-cod" class="form-horizontal">
        <table class="table">
        <tr>
        <td width="25%"><span class="required">*</span> <?php echo $entry_license; ?></td>
        <td><input type="text" name="bankkvi_pay_license" value="<?php if (isset($bankkvi_pay_license)){ echo $bankkvi_pay_license; }?>" />
          <br />
          <?php if ($error_license) { ?>
          <span class="error"><?php echo $error_license; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_bank; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="bankkvi_pay_bank_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'bankkvi_pay_bank_' . $language['language_id']}) ? ${'bankkvi_pay_bank_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?>
            <?php if (isset(${'error_bank'})) { ?>
            <span class="error"><?php echo ${'error_bank'}; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_inn; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <input name="bankkvi_pay_inn_<?php echo $language['language_id']; ?>" type="text" size="20" value="<?php echo isset(${'bankkvi_pay_inn_' . $language['language_id']}) ? ${'bankkvi_pay_inn_' . $language['language_id']} : ''; ?>" /><br /><?php } ?>
            <?php if (isset(${'error_inn'})) { ?>
            <span class="error"><?php echo ${'error_inn'}; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_rs; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <input name="bankkvi_pay_rs_<?php echo $language['language_id']; ?>" type="text" size="20" value="<?php echo isset(${'bankkvi_pay_rs_' . $language['language_id']}) ? ${'bankkvi_pay_rs_' . $language['language_id']} : ''; ?>" /><br /><?php } ?>
            <?php if (isset(${'error_rs'})) { ?>
            <span class="error"><?php echo ${'error_rs'}; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_bankuser; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <input name="bankkvi_pay_bankuser_<?php echo $language['language_id']; ?>" type="text" size="20" value="<?php echo isset(${'bankkvi_pay_bankuser_' . $language['language_id']}) ? ${'bankkvi_pay_bankuser_' . $language['language_id']} : ''; ?>" /><br /><?php } ?>
            <?php if (isset(${'error_bankuser'})) { ?>
            <span class="error"><?php echo ${'error_bankuser'}; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_bik; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <input name="bankkvi_pay_bik_<?php echo $language['language_id']; ?>" type="text" size="20" value="<?php echo isset(${'bankkvi_pay_bik_' . $language['language_id']}) ? ${'bankkvi_pay_bik_' . $language['language_id']} : ''; ?>" /><br /><?php } ?>
            <?php if (isset(${'error_bik'})) { ?>
            <span class="error"><?php echo ${'error_bik'}; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_ks; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <input name="bankkvi_pay_ks_<?php echo $language['language_id']; ?>" type="text" size="20" value="<?php echo isset(${'bankkvi_pay_ks_' . $language['language_id']}) ? ${'bankkvi_pay_ks_' . $language['language_id']} : ''; ?>" /><br /><?php } ?>
            <?php if (isset(${'error_bank'})) { ?>
            <span class="error"><?php echo ${'error_ks'}; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_invoi; ?></td>
          <td><select name="bankkvi_pay_invoi">
              
              <?php if ('invoi_zakaz' == $bankkvi_pay_invoi) { ?>
              <option value="invoi_zakaz" selected="selected"><?php echo $entry_invoi_zakaz; ?></option>
              <?php } else { ?>
              <option value="invoi_zakaz"><?php echo $entry_invoi_zakaz; ?></option>
              <?php } ?>

              <?php if ('invoi_zakazdc' == $bankkvi_pay_invoi) { ?>
              <option value="invoi_zakazdc" selected="selected"><?php echo $entry_invoi_zakazdc; ?></option>
              <?php } else { ?>
              <option value="invoi_zakazdc"><?php echo $entry_invoi_zakazdc; ?></option>
              <?php } ?>

              <?php if ('invoi_zakazd' == $bankkvi_pay_invoi) { ?>
              <option value="invoi_zakazd" selected="selected"><?php echo $entry_invoi_zakazd; ?></option>
              <?php } else { ?>
              <option value="invoi_zakazd"><?php echo $entry_invoi_zakazd; ?></option>
              <?php } ?>

              <?php if ('invoi_custom' == $bankkvi_pay_invoi) { ?>
              <option value="invoi_custom" selected="selected"><?php echo $entry_invoi_custom; ?></option>
              <?php } else { ?>
              <option value="invoi_custom"><?php echo $entry_invoi_custom; ?></option>
              <?php } ?>


            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_invoi_custom_text; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="bankkvi_pay_invoi_custom_<?php echo $language['language_id']; ?>" cols="50" rows="1"><?php echo isset(${'bankkvi_pay_invoi_custom_' . $language['language_id']}) ? ${'bankkvi_pay_invoi_custom_' . $language['language_id']} : ''; ?></textarea><br />
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_whois; ?></td>
          <td><select name="bankkvi_pay_whois">
              
              <?php if ('whois_goradr' == $bankkvi_pay_whois) { ?>
              <option value="whois_goradr" selected="selected"><?php echo $entry_whois_goradr; ?></option>
              <?php } else { ?>
              <option value="whois_goradr"><?php echo $entry_whois_goradr; ?></option>
              <?php } ?>

              <?php if ('whois_indoblgoradr' == $bankkvi_pay_whois) { ?>
              <option value="whois_indoblgoradr" selected="selected"><?php echo $entry_whois_indoblgoradr; ?></option>
              <?php } else { ?>
              <option value="whois_indoblgoradr"><?php echo $entry_whois_indoblgoradr; ?></option>
              <?php } ?>

              <?php if ('whois_custom' == $bankkvi_pay_whois) { ?>
              <option value="whois_custom" selected="selected"><?php echo $entry_whois_custom; ?></option>
              <?php } else { ?>
              <option value="whois_custom"><?php echo $entry_whois_custom; ?></option>
              <?php } ?>

            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_whois_custom_text; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="bankkvi_pay_whois_custom_<?php echo $language['language_id']; ?>" cols="50" rows="1"><?php echo isset(${'bankkvi_pay_whois_custom_' . $language['language_id']}) ? ${'bankkvi_pay_whois_custom_' . $language['language_id']} : ''; ?></textarea><br />
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_bankkvi_pay_name_tab; ?></td>
          <td><?php if ($bankkvi_pay_name_attach) { ?>
            <input type="radio" name="bankkvi_pay_name_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <input type="radio" name="bankkvi_pay_name_attach" value="0" />
            <?php echo $text_default; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_name_attach" value="1" />
            <?php echo $text_my; ?>
            <input type="radio" name="bankkvi_pay_name_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_bankkvi_pay_name; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="bankkvi_pay_name_<?php echo $language['language_id']; ?>" cols="50" rows="1"><?php echo isset(${'bankkvi_pay_name_' . $language['language_id']}) ? ${'bankkvi_pay_name_' . $language['language_id']} : ''; ?></textarea><br />
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_currency; ?></td>
          <td><select name="bankkvi_pay_currency">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['code'] == $bankkvi_pay_currency) { ?>
                    <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    <?php if ('SHOP' == $bankkvi_pay_currency) { ?>
                    <option value="SHOP" selected="selected"><?php echo $text_currency_order; ?></option>
                    <?php } else { ?>
                    <option value="SHOP"><?php echo $text_currency_order; ?></option>
                    <?php } ?>
              </select>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_fixen ; ?></td>
          <td><?php if ($bankkvi_pay_fixen == 'proc') { ?>
            <input type="radio" name="bankkvi_pay_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?>
            <input type="radio" name="bankkvi_pay_fixen" value="proc" checked="checked" />
            <?php echo $entry_fixen_proc; ?>
            <input type="radio" name="bankkvi_pay_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else if($bankkvi_pay_fixen == 'fix'){ ?>
            <input type="radio" name="bankkvi_pay_fixen" value="fix" checked="checked" />
            <?php echo $entry_fixen_fix; ?>
            <input type="radio" name="bankkvi_pay_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?>
            <input type="radio" name="bankkvi_pay_fixen" value="0" />
            <?php echo $entry_fixen_order; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_fixen" value="fix" />
            <?php echo $entry_fixen_fix; ?>
            <input type="radio" name="bankkvi_pay_fixen" value="proc" />
            <?php echo $entry_fixen_proc; ?>
            <input type="radio" name="bankkvi_pay_fixen" value="0" checked="checked" />
            <?php echo $entry_fixen_order; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fixen_amount; ?></td>
          <td><input type="text" name="bankkvi_pay_fixen_amount" value="<?php echo isset($bankkvi_pay_fixen_amount) ? $bankkvi_pay_fixen_amount : ''; ?>" ><br />
          <?php if ($error_fixen) { ?>
          <span class="error"><?php echo $error_fixen; ?></span>
          <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_komis; ?></td>
          <td><input type="text" name="bankkvi_pay_komis" value="<?php echo isset($bankkvi_pay_komis) ? $bankkvi_pay_komis : ''; ?>" >%</td>
        </tr>
        <tr>
          <td><?php echo $entry_minpay; ?></td>
          <td><input type="text" name="bankkvi_pay_minpay" value="<?php echo isset($bankkvi_pay_minpay) ? $bankkvi_pay_minpay : ''; ?>" >
            <select name="bankkvi_pay_minpay_currency">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['code'] == $bankkvi_pay_minpay_currency) { ?>
                    <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
              </select>
            </td>
        </tr>
        <tr>
          <td><?php echo $entry_maxpay; ?></td>
          <td><input type="text" name="bankkvi_pay_maxpay" value="<?php echo isset($bankkvi_pay_maxpay) ? $bankkvi_pay_maxpay : ''; ?>" >
            <select name="bankkvi_pay_maxpay_currency">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['code'] == $bankkvi_pay_maxpay_currency) { ?>
                    <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
              </select>
            </td>
        </tr>
        <tr>
          <td><?php echo $entry_instruction; ?></td>
          <td><?php if ($bankkvi_pay_instruction_attach) { ?>
            <input type="radio" name="bankkvi_pay_instruction_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="bankkvi_pay_instruction_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_instruction_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="bankkvi_pay_instruction_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_bank_instruction; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="bankkvi_pay_instruction_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'bankkvi_pay_instruction_' . $language['language_id']}) ? ${'bankkvi_pay_instruction_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_mail_instruction; ?></td>
          <td><?php if ($bankkvi_pay_mail_instruction_attach) { ?>
            <input type="radio" name="bankkvi_pay_mail_instruction_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="bankkvi_pay_mail_instruction_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_mail_instruction_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="bankkvi_pay_mail_instruction_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_bank_mail_instruction; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="bankkvi_pay_mail_instruction_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'bankkvi_pay_mail_instruction_' . $language['language_id']}) ? ${'bankkvi_pay_mail_instruction_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_page; ?></td>
          <td><?php if ($bankkvi_pay_success_page) { ?>
            <input type="radio" name="bankkvi_pay_success_page" value="1" checked="checked" />
            <?php echo $text_standart; ?>
            <input type="radio" name="bankkvi_pay_success_page" value="0" />
            <?php echo $text_module_page; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_success_page" value="1" />
            <?php echo $text_standart; ?>
            <input type="radio" name="bankkvi_pay_success_page" value="0" checked="checked" />
            <?php echo $text_module_page; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_page_custom_attach; ?></td>
          <td><?php if ($bankkvi_pay_success_page_custom_attach) { ?>
            <input type="radio" name="bankkvi_pay_success_page_custom_attach" value="1" checked="checked" />
            <?php echo $text_my; ?>
            <input type="radio" name="bankkvi_pay_success_page_custom_attach" value="0" />
            <?php echo $text_default; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_success_page_custom_attach" value="1" />
            <?php echo $text_my; ?>
            <input type="radio" name="bankkvi_pay_success_page_custom_attach" value="0" checked="checked" />
            <?php echo $text_default; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_success_page_custom; ?></td>
          <td><?php foreach ($languages as $language) { ?><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" style="vertical-align:top;"/> <textarea name="bankkvi_pay_success_page_custom_<?php echo $language['language_id']; ?>" cols="50" rows="3"><?php echo isset(${'bankkvi_pay_success_page_custom_' . $language['language_id']}) ? ${'bankkvi_pay_success_page_custom_' . $language['language_id']} : ''; ?></textarea><br /><?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_securelink; ?></td>
          <td><?php if ($bankkvi_pay_securelink) { ?>
            <input type="radio" name="bankkvi_pay_securelink" value="1" checked="checked" />
            <?php echo $text_no; ?>
            <input type="radio" name="bankkvi_pay_securelink" value="0" />
            <?php echo $text_yes; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_securelink" value="1" />
            <?php echo $text_no; ?>
            <input type="radio" name="bankkvi_pay_securelink" value="0" checked="checked" />
            <?php echo $text_yes; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_bankkvi_pay_email_attach; ?></td>
          <td><?php if ($bankkvi_pay_email_attach) { ?>
            <input type="radio" name="bankkvi_pay_email_attach" value="1" checked="checked" />
            <?php echo $text_yes; ?>
            <input type="radio" name="bankkvi_pay_email_attach" value="0" />
            <?php echo $text_no; ?>
            <?php } else { ?>
            <input type="radio" name="bankkvi_pay_email_attach" value="1" />
            <?php echo $text_yes; ?>
            <input type="radio" name="bankkvi_pay_email_attach" value="0" checked="checked" />
            <?php echo $text_no; ?>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_start_order_status; ?></td>
          <td><select name="bankkvi_pay_start_order_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $bankkvi_pay_start_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_order_status; ?></td>
          <td><select name="bankkvi_pay_order_status_id">
              <?php foreach ($order_statuses as $order_status) { ?>
              <?php if ($order_status['order_status_id'] == $bankkvi_pay_order_status_id) { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_geo_zone; ?></td>
          <td><select name="bankkvi_pay_geo_zone_id">
              <option value="0"><?php echo $text_all_zones; ?></option>
              <?php foreach ($geo_zones as $geo_zone) { ?>
              <?php if ($geo_zone['geo_zone_id'] == $bankkvi_pay_geo_zone_id) { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_status; ?></td>
          <td><select name="bankkvi_pay_status">
              <?php if ($bankkvi_pay_status) { ?>
              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
              <option value="0"><?php echo $text_disabled; ?></option>
              <?php } else { ?>
              <option value="1"><?php echo $text_enabled; ?></option>
              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
              <?php } ?>
            </select></td>
        </tr>
        <tr>
          <td><?php echo $entry_sort_order; ?></td>
          <td><input type="text" name="bankkvi_pay_sort_order" value="<?php echo $bankkvi_pay_sort_order; ?>" size="1" /></td>
        </tr>
      </table>
    </form>
  </div><p style="text-align:center">BankKvi_Pay Версия <?php echo $version; ?></p>
</div>
</div>
<script type="text/javascript"><!--
$('#languages a').tabs();
//--></script>
<script type="text/javascript"><!--
$('#comment').summernote({height: 300});
//--></script> 
<?php echo $footer; ?>