<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<a href="#" class="show-sidebar">
			<i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">基础数据</a></li>
			<li><a href="#">供应商</a></li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name">
					<i class="fa  fa-list-alt"></i>
					<span>供应商管理</span>
				</div>  
			</div>
			<div class="box-content   table-responsive"> 
		<!-- 表上部操作区 -->
			 
				<div class="custom-toolbar">
					<button class="btn btn-default " onclick="showCreateSupplier()">新增</button>
				</div>  
			
			<table id="tb" data-toggle="table" data-toolbar=".custom-toolbar"
       data-url="supplier/list"
       data-pagination="true"
       data-side-pagination="server"
        data-page-size="20"
       data-page-list="[5, 10, 20, 50, 100, 200]"
       data-search="true" >
    <thead>
    <tr>
        <th data-field="supplierCode" data-align="center" data-sortable="true">代码</th>
        <th data-field="supplierName" data-align="center" data-sortable="true">名称</th>
        <th data-field="address" data-align="center" data-sortable="true">地址</th>
        <th data-field="supTypeName" data-align="center" data-sortable="true">类别</th>
        <th data-field="supRankName" data-align="center" data-sortable="true">等级</th>	
        <th data-field="supplierId" data-align="center" data-sortable="false" data-formatter="actionFormatter">操作</th>
        
        
    </tr>
    </thead>
</table>
			</div>
		</div>
	</div>
</div>


		


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
                               新增供应商
            </h4>
         </div>
         <div id="form_ajax">
		<form id="defaultForm" role="form" method="post" action="supplier/create"
					class="form-horizontal"> 
         <div class="modal-body">
           	<div id="bitmap-editor" class="box-content">
           	           
						
						<div class="form-group">
							<div class="col-sm-5">
								<input type="hidden" class="form-control" name="supplierId" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">供应商代码</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="supplierCode" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">供应商名称</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="supplierName" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">供应商地址</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="address" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">供应商类别</label>
							<div class="col-sm-5">
								 <input type="hidden"  id="ao-select2-supTypeId" name="supTypeId" >
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">供应商等级</label>
							<div class="col-sm-5">
								 <input type="hidden"    id="ao-select2-supRankId" name="supRankId">
									
								</select>
							</div>
						</div>
				
			</div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">
                            取消
            </button>
            <button type="submit" class="btn btn-primary" >
                           确定
            </button>
         </div>
         </form>
         </div>
      </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>

<script src="js/validation/configure_val.js"></script>
<script type="text/javascript">

var mat_form; 

function showModel(){
	$('#myModal').modal('show');
}
function showCreateSupplier(){
	$("#myModalLabel").html("新增供应商"); 
	$('#defaultForm').resetForm();
	$('#defaultForm').clearForm();
	
    $('#ao-select2-supTypeId').select2('val', "");
    $('#ao-select2-supRankId').select2('val', "");
    $('#ao-select2-supTypeId').trigger("change"); 
	$('#ao-select2-supRankId').trigger("change"); 
	  
	showModel();
}

function doSubmit(){
	mat_form.submit();
}

function updateSupplier(supplierId){
	 //$('#defaultForm').clearForm();
	 $("#myModalLabel").html("更新供应商"); 
	 var dataExample;
	 var htmlobj=$.ajax({
	     url:"supplier/retrieve/"+supplierId,async:false
	 });
 	//return a json to fill the from.
    var jsonData = $.parseJSON(htmlobj.responseText);
	$("#defaultForm").autofill(jsonData); 
    
 	//return a json to fill the from.
    $('#ao-select2-supTypeId').trigger("change");
    $('#ao-select2-supRankId').trigger("change");
	showModel();
	
}

function deleteSupplier(id){
	$.ajax({url:"supplier/delete/"+id,async:false});
	 $('#tb').bootstrapTable('refresh');
}

function actionFormatter(value, row, index){
	 return '<div class="btn-group   btn-group-sm" role="group" aria-label="...">'
		+'<button type="button"  onclick=updateSupplier('+ value +') class="btn btn-default">修改</button>'
		+'<button type="button" onclick=deleteSupplier('+ value +') class="btn btn-default ">删除</button>'
	    +'</div>';
}
$(document).ready(function() {
    
	$('#tb').bootstrapTable();
	
	var options = {  
			  // target: '#output',          //把服务器返回的内容放入id为output的元素中      
			   beforeSubmit: showRequest,  //提交前的回调函数  
			   success: showResponse,      //提交后的回调函数   
			   error: showError,
			  // url: url,                 //默认是form的action， 如果申明，则会覆盖  
			  // type: type,               //默认是form的method（get or post），如果申明，则会覆盖  
			  dataType: "html",           //html, xml, script, json...接受服务端返回的类型  
			  clearForm: true,          //成功提交后，清除所有表单元素的值  
			  resetForm: true,          //成功提交后，重置所有表单元素的值  
			  timeout: 10000               //限制请求的时间，当请求大于10秒后，跳出请求  
			}  
	mat_form = $("#defaultForm").ajaxForm(options);
	
	function showRequest(){
		 if($('#defaultForm').data('bootstrapValidator').isValid()){
		    }else{
		    	return false;
		    }
		$('.loading').show();
	}
	function showResponse(){ 
		$('#tb').bootstrapTable('refresh');
		$('#myModal').modal('hide');
		$('.loading').hide();
	}
	function showError(data){
		$('.loading').hide();
		alert('error');
		//$('#myModal').modal('hide');
		
	}
	

	function MakeSelect2(){
		var supTypesData = $.parseJSON($.ajax({
            url : "supplier/types",
            async : false
        }).responseText);

	var supRanksData = $.parseJSON($.ajax({
            url : "supplier/ranks",
            async : false
        }).responseText);
        
	$('#ao-select2-supTypeId').select2({
        placeholder : "--- 请选择 ---",
        data : $.map(supTypesData, function(item) {
            return {
                id : item.supTypeId,
                text : item.supTypeName
            };
        })
    });
    
    $('#ao-select2-supRankId').select2({
                placeholder : "--- 请选择 ---",
                data : $.map(supRanksData, function(item) {
                return {
                    id : item.supRankId,
                    text : item.supRankName
                    };
                })
            });	
	} 
	LoadSelect2Script(MakeSelect2);   
	
	// Load example of form validation
    LoadBootstrapValidatorScript(configure_val);
});
</script>
