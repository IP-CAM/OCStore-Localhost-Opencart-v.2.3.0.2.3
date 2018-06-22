<?php if ($instructionat){ ?>
<h2><?php echo $text_instruction; ?></h2>
<div class="content">
  <p><?php echo $bank; ?></p>
</div>
<?php } ?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<script type="text/javascript">
$('#button-confirm').bind('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=extension/payment/bankkvi_pay/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
</script>
