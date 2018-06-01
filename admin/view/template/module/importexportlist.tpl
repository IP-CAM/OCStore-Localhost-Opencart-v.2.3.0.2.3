<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-importexport" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-importexport" class="form-horizontal">
            <div class="table-responsive">
            <table class="table-bordered">
              <thead>
              <tr>
                <th>CSV Headings</th>
                <th>Map to</th>
              </tr>
              </thead>
              <tbody>
                <?php foreach($headercsv as $key=> $headings){ ?>
                  <tr>
                    <td><?php echo $headings; ?></td>
                    <td>

                 <select class="form-control" name="mapto[<?php echo $key; ?>]" data-src="<?php echo $headings; ?>" >
                   <option data-src="<?php echo $headings; ?>" value="0">Select options</option>
                    <?php foreach($table_structure as $tabledata){ ?>

                    <option data-src="<?php echo $headings; ?>" value="<?php echo $tabledata['Field']; ?>"><?php echo $tabledata['Field']; ?></option>

                      <?php } ?>
                 </select>

                    </td>
                  </tr>
                  <?php } ?>
              </tbody>
            </table>
            </div>
            <input type="hidden" name="uploadedFileName" value="<?php echo $uploadedFileName; ?>">
        <div class="form-group">
          <input type="button" id="maptocsv" class="btn btn-info" name="maptocsv" value="Map To Headings">
        </div>
      </form>

      <button type="button" id="openlist" class="btn btn-info btn-lg hidden" data-toggle="modal" data-target="#openNotMap">Open Modal</button>

      <!-- Modal -->
      <div id="openNotMap" class="modal fade" role="dialog">
        <div class="modal-dialog">

          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Mapped List</h4>
            </div>
            <div class="modal-body" id="notmaplist">
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Map</button>
              <button type="button" id="removerow" class="btn btn-warning">Skip Not Mapped</button>
              <button type="button" id="savedata" name="maptocsv" class="btn btn-success"><i class="fa fa-save"> Save Data</i></button>
            </div>
          </div>

        </div>
      </div>
      </div>
    </div>
  </div>
</div>



<script>
$("#removerow").click(function(){
  $(".removerows").remove();
});
$("#savedata").click(function(){
  $("#form-importexport").submit();
});
$("#maptocsv").click(function(){
  var data=$("select option:selected");
  var html="";
  html +="<table class='table-bordered'><thead><tr><th>Csv Heading </th><th>Map to csv</th></tr></thead><tbody>";
    $(data).each(function () {
      if($(this).val()==0){
       html +="<tr class='removerows'>";
     }else{
       html +="<tr>";
     }
       html+="<td>"+ $(this).attr('data-src') +"</td><td>"+ $(this).val()+"</td></tr>";
     });
  html+="</tbody></table>";
  $("#openlist").click();
  $("#notmaplist").html(html);
});

</script>
<?php echo $footer; ?>
