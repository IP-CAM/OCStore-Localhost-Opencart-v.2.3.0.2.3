<?php if ($style == 'html' || $style == 'printer') { ?>
<!DOCTYPE html>
<html>
<head>
<title><?php echo $form_name; ?></title>
<?php } ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">
<?php if ($style == 'html' || $style == 'printer') { ?>
body {font-family:Arial, Helvetica, sans-serif;/*font-size:14px;*/}
<?php } ?>
a {color:#006400;}
p {padding: 5px 0px 0px 5px;}
.vas ul {padding: 0px 10px 0px 15px;}
.vas li {list-style-type:circle;}
h3 {padding:0px 0px 0px 5px;font-size:100%;}
h1 {color:#006400;padding:0px 0px 0px 5px;font-size:120%;}
li {list-style-type: none;padding-bottom:5px;padding: 6px 0px 0px 5px;}
.main {font-size:12px;}
.list {font-size:12px;padding: 6px 15px 0px 5px;}
.main input {font-size:12px;background-color:#CCFFCC;}
.text14 {font-size:14px;}
.text14 strong {font-size:11px;}
.link {font-size:12px;}
.link a {text-decoration:none;color:#006400;}
.link_u {font-size:12px;}
.link_u a {color:#006400;}
<?php if ($style == 'pdf') { ?>
a {color:#006400;}
p {padding: 5px 0px 0px 5px;}
.vas ul {padding: 0px 10px 0px 15px;}
.vas li {list-style-type:circle;}
h3 {padding:0px 0px 0px 5px;font-size:100%;}
h1 {color:#006400;padding:0px 0px 0px 5px;font-size:120%;}
li {list-style-type: none;padding-bottom:5px;padding: 6px 0px 0px 5px;}
.main {font-size:12px;}
.list {font-size:12px;padding: 6px 15px 0px 5px;}
.main input {font-size:12px;background-color:#CCFFCC;}
.text14 {font-size:14px;}
.text14 strong {font-size:11px;}
.link {font-size:12px;}
.link a {text-decoration:none;color:#006400;}
.link_u {font-size:12px;}
.link_u a {color:#006400;}
<?php } ?>
</style>
<?php if ($style == 'html') { ?>
</head>
<body>
<?php } ?>
<?php if ($style == 'printer') { ?>
</head>
<body onload="doPrint()">
<?php } ?>
<div class="text14">
  <table <?php if ($style == 'html' || $style == 'printer') { ?>width="720"<?php } ?><?php if ($style == 'pdf') { ?>width="520"<?php } ?> bordercolor="#000000" style="border:#000000 1px solid;" cellpadding="0" cellspacing="0">
    <tr>
      <td <?php if ($style == 'html' || $style == 'printer') { ?>width="220"<?php } ?><?php if ($style == 'pdf') { ?>width="180"<?php } ?> valign="top" height="250" align="center" style="border-bottom:#000000 1px solid; border-right:#000000 1px solid;"> <strong><?php echo $form_platezh; ?></strong></td>
      <td valign="top" style="border-bottom:#000000 1px solid; border-right:#000000 1px solid;">
        <li><strong><?php echo $form_poluch; ?> </strong> <font style="font-size:90%"> <?php echo $bank; ?></font><br />
        <li><strong><?php echo $form_bankinn; ?></strong> <?php echo $inn; ?> <font style="font-size:11px"></font> <strong>P/сч.:</strong> <?php echo $rs; ?><br />
        <li> <strong><?php echo $form_v; ?></strong> <font style="font-size:90%"><?php echo $bankuser; ?></font><br />
        <li><strong><?php echo $form_bik; ?></strong> <?php echo $bik; ?> <strong><?php echo $form_ks; ?></strong> <?php echo $ks; ?> <br />
        <li><strong><?php echo $form_plat; ?></strong> <font style="font-size:90%"><?php echo $invoi; ?></font><br />
        <li><strong><?php echo $form_platelshik; ?></strong> <?php echo $name; ?> <br />
        <li><strong><?php echo $form_adress; ?></strong> <font style="font-size:90%"> <?php echo $address; ?></font><br />
        <li><strong><?php echo $form_inn; ?></strong> ____________  <strong>   <?php echo $form_lich; ?></strong> ______________
        <li><strong><?php echo $form_summa; ?></strong> <?php echo $syleft.$amount; ?><?php echo $syright; ?><?php echo $amount2; ?><?php echo $sycop; ?>  <strong><?php echo $form_banksumma; ?></strong> <?php echo $syleft; ?>______ <?php echo $syright; ?> __ <?php echo $sycop; ?><br />
          <br />
          <?php echo $form_podpis; ?>________________________        <?php echo $form_date; ?> &quot; __ &quot; _______  20___г. <br />
          <br />
      </td>
    </tr>
    <tr>
      <td <?php if ($style == 'html' || $style == 'printer') { ?>width="220"<?php } ?><?php if ($style == 'pdf') { ?>width="180"<?php } ?> valign="top" height="250" align="center" style="border-bottom:#000000 1px solid; border-right:#000000 1px solid;"> <strong><?php echo $form_kvi; ?></strong></td>
      <td valign="top" style="border-bottom:#000000 1px solid; border-right:#000000 1px solid;">
        <li><strong><?php echo $form_poluch; ?> </strong> <font style="font-size:90%"> <?php echo $bank; ?></font><br />
        <li><strong><?php echo $form_bankinn; ?></strong> <?php echo $inn; ?> <font style="font-size:11px"></font> <strong>P/сч.:</strong> <?php echo $rs; ?><br />
        <li> <strong><?php echo $form_v; ?></strong> <font style="font-size:90%"><?php echo $bankuser; ?></font><br />
        <li><strong><?php echo $form_bik; ?></strong> <?php echo $bik; ?> <strong><?php echo $form_ks; ?></strong> <?php echo $ks; ?> <br />
        <li><strong><?php echo $form_plat; ?></strong> <font style="font-size:90%"><?php echo $invoi; ?></font><br />
        <li><strong><?php echo $form_platelshik; ?></strong> <?php echo $name; ?> <br />
        <li><strong><?php echo $form_adress; ?></strong> <font style="font-size:90%"> <?php echo $address; ?></font><br />
        <li><strong><?php echo $form_inn; ?></strong> ____________  <strong>   <?php echo $form_lich; ?></strong> ______________
        <li><strong><?php echo $form_summa; ?></strong> <?php echo $syleft.$amount; ?><?php echo $syright; ?><?php echo $amount2; ?><?php echo $sycop; ?>  <strong><?php echo $form_banksumma; ?></strong> <?php echo $syleft; ?>______ <?php echo $syright; ?> __ <?php echo $sycop; ?><br />
          <br />
          <?php echo $form_podpis; ?>________________________        <?php echo $form_date; ?> &quot; __ &quot; _______  20___г. <br />
          <br />
      </td>
    </tr>
  </table>
</div>
<?php if ($style == 'html') { ?>
</body>
</html>
<?php } ?>
<?php if ($style == 'printer') { ?>
<script type="text/javascript">
            function doPrint() {
                window.print();
                window.close();
            }
</script>
</body>
</html>
<?php } ?>