<div class="row">
	<div id="breadcrumb" class="col-xs-12">
		<a href="#" class="show-sidebar">
			<i class="fa fa-bars"></i>
		</a>
		<ol class="breadcrumb pull-left">
			<li><a href="#">基础数据</a></li>
			<li><a href="#">物料</a></li>
		</ol>
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-header">
				<div class="box-name">
					<i class="fa  fa-list-alt"></i>
					<span>物料管理</span>
				</div>  
			</div>
			<div class="box-content   table-responsive"> 
		<!-- 表上部操作区 -->
			 
				<div class="custom-toolbar">
					<button class="btn btn-default " onclick="showCreateMaterial()">新增</button>
					<button id="button-remove-materials" class="btn btn-default " disabled>删除</button>
				</div>  
			
			<table id="tb" data-toggle="table" data-toolbar=".custom-toolbar"
       data-url="material/list"
       data-pagination="true"
       data-side-pagination="server"
        data-page-size="20"
       data-page-list="[5, 10, 20, 50, 100, 200]"
       data-search="true" >
    <thead>
    <tr>
    	<th data-field="state" data-checkbox="true"></th>
        <th data-field="materialId" data-align="center" data-sortable="true">ID</th>
        <th data-field="materialCode" data-align="center" data-sortable="true">物料编号</th>
        <th data-field="materialName" data-align="center" data-sortable="true">物料名称</th>
        <th data-field="uomName" data-align="center" data-sortable="true">计价单位</th>
        <th data-field="refPrice" data-align="center" data-sortable="true">参考价格</th>
        <th data-field="matTypeName" data-align="center" data-sortable="true">类型</th>
        <th data-field="materialId" data-align="center" data-sortable="false" data-formatter="actionFormatter">操作</th>
        
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
                               新增物料
            </h4>
         </div>
         <div id="form_ajax">
		<form id="defaultForm" role="form" onsubmit="return false"  method="post" action="material/create"
					class="form-horizontal"> 
         <div class="modal-body">
           	<div id="bitmap-editor" class="box-content">
						<div class="form-group">
							<label class="col-sm-3 control-label">ID</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="materialId" readonly/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">物料代码</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="materialCode"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">物料名称</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="materialName" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">计量单位</label>
							<div class="col-sm-5">
								<input type="hidden" id="ao-select2-unit" name="uomId"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">参考价格</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="refPrice" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">物料类型</label>
							<div class="col-sm-5">
                				<input type="hidden" id="ao-select2-matTypeId" name="matTypeId"/>
              				</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">有效期（暂不用）</label>
							<div class="col-sm-5"> 
							  <div class="input-group date" id="ao-date-pick">
									<input  class="form-control"  type="text" name="expired_date" readonly />
									 <span class="input-group-addon" ><i class="glyphicon glyphicon-calendar"></i></span>  
							  </div>
							</div>
						</div>
						
						
				
			</div>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">
                            取消
            </button>
            <button type="button" onclick="doSubmit()" class="btn btn-primary" >
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
var mat_select_unit;
var mat_select_type;
var $table;
var selections = [];
var $remove = $('#button-remove-materials');
function showModel(){
	  $('#defaultForm').resetForm();
	  $('#defaultForm').clearForm();
	  $('#ao-select2-unit').select2("val", '');
	  $('#ao-select2-matTypeId').select2("val",'');
	  $('#ao-select2-unit').trigger("change"); 
	  $('#ao-select2-matTypeId').trigger("change"); 
	  $('#myModal').modal('show');
}
function showCreateMaterial(){
	$("#myModalLabel").html("新增物料"); 
	
	  
	showModel();
}

function doSubmit(){
	mat_form.submit();
}

function updateMaterial(id){
	 $("#myModalLabel").html("更新物料"); 
	 var htmlobj=$.ajax({url:"material/retrieve/"+id,async:false});//hint: handle in controller "material/retreive/{id}"  @PathVariable("id") String id 
	 var jsonCotent = $.parseJSON(htmlobj.responseText);
     showModel();
 	 //return a json to fill the form.
	$("#defaultForm").autofill(jsonCotent);
    $('#ao-select2-unit').trigger("change"); 
    $('#ao-select2-matTypeId').trigger("change"); 
    
}


function actionFormatter(value, row, index){
	 return '<div class="btn-group   btn-group-sm" role="group" aria-label="...">'
		+'<button type="button"  onclick=updateMaterial('+ value +') class="btn btn-default">修改</button>'
	    +'</div>';
}
$(document).ready(function() {

	$table=  $('#tb').bootstrapTable();
 
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
	
	$('#ao-date-pick').datepicker({
		  format: 'yyyy年mm月dd日', 
	        weekStart: 1,
	        autoclose: true,
	        container:'.modal-dialog',// control display place
	        viewMode:'0',
	        clearBtn:true,
	      //  todayBtn: 'linked',
	        language: 'zh-CN'
	 }).on('changeDate',function(ev){
	  var startTime = ev.date.valueOf();  
	   $("#ao-date-pick").focus();
	  });  
	
	function MakeSelect2(){
		//mat_select_unit = $('#ao-select2-unit').select2();  
		
	    //mat_select_type = $('#ao-select2-matTypeId').select2(); 
	    var htmlobj=$.ajax({url:"unit/list",async:false});//hint: handle in controller "material/retreive/{id}"  @PathVariable("id") String id 
	    var jsonCotent = $.parseJSON(htmlobj.responseText);
	    	$('#ao-select2-unit').select2({
                placeholder : "--- 请选择 ---",
                //multiple : false,
                data: $.map(jsonCotent, function(item) {
                                return {
                                    id : item.uomId,
                                    text : item.uomName
                                };
                            })
            });
	    	var htmlobj2=$.ajax({url:"materialType/list",async:false});//hint: handle in controller "material/retreive/{id}"  @PathVariable("id") String id 
		    var jsonCotent2 = $.parseJSON(htmlobj2.responseText);
            $('#ao-select2-matTypeId').select2({
                placeholder : "--- 请选择 ---",
                //multiple : false,
                 data: $.map(jsonCotent2, function(item) {
                                return {
                                    id : item.matTypeId,
                                    text : item.matTypeName
                                };
                            })
             
        });
           
	    
	}
	
	$table.on('check.bs.table uncheck.bs.table load-success.bs.table ' +
             'check-all.bs.table uncheck-all.bs.table', function () {
         $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);
     });//如果有check box选中,delete才可以点
     $remove.click(function () {
    	 
    	 $.messager.model = { 
    		        ok:{ text: "确定", classed: 'btn-default' },
    		        cancel: { text: "取消", classed: 'btn-error' }
    		      };
    	 $.messager.confirm("确认", "是否确认删除选中的物料?", function() { 
	    		 var ids = getIdSelections();
	             $.ajax({
	            	 url:"material/delete",
	            	 type:"post",
	            	 data:{materialIds:ids},
	            	 async:false,
	            	 success:function(){$.messager.alert('删除成功')},
	            	 error:function(){$.messager.alert('删除失败')}
	            });
	             $remove.prop('disabled', true);
	             $table.bootstrapTable('refresh');
    	 });
    	 
        
     });//点击删除的处理逻辑
     
     function getIdSelections() {
         return $.map($table.bootstrapTable('getSelections'), function (row) { 
             return row.materialId
         });
     }
	

	// Load example of form validation
	LoadBootstrapValidatorScript(configure_val);
	LoadSelect2Script(MakeSelect2);  
	
});
</script>
