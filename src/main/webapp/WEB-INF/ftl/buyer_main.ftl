<div class="row">
  <div id="breadcrumb" class="col-xs-12">
    <a href="#" class="show-sidebar"> <i class="fa fa-bars"></i>
    </a>
    <ol class="breadcrumb pull-left">
      <li><a href="#">基础数据</a></li>
      <li><a href="#">采购员</a></li>
    </ol>
  </div>
</div>

<div class="row">
  <div class="col-xs-12">
    <div class="box">
      <div class="box-header">
        <div class="box-name">
          <i class="fa  fa-list-alt"></i> <span>采购员管理</span>
        </div>
      </div>
      <div class="box-content   table-responsive">
        <!-- 表上部操作区 -->

        <div class="custom-toolbar">
          <button class="btn btn-default " onclick="create()">新增</button>
        </div>

        <table id="tb" data-toggle="table" data-toolbar=".custom-toolbar" data-url="buyer/list" data-pagination="true"
          data-side-pagination="server" data-page-size="20" data-page-list="[5, 10, 20, 50, 100, 200]"
          data-search="true">
          <thead>
            <tr>
              <th data-field="buyerId" data-align="center" data-sortable="true">采购员编号</th>
              <th data-field="buyerCode" data-align="center" data-sortable="true">代码</th>
              <th data-field="buyerName" data-align="center" data-sortable="true">姓名</th>
              <th data-field="genderName" data-align="center" data-sortable="true">性别</th>
              <th data-field="buyerId" data-align="center" data-sortable="false" data-formatter="actionFormatter">操作</th>
            </tr>
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>


<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel">新增采购员</h4>
      </div>

      <form id="defaultForm" role="form" onsubmit="return false" method="post" action="buyer/save"
        class="form-horizontal">
        <div class="modal-body">
          <div id="bitmap-editor" class="box-content">
            <div class="form-group">
              <label class="col-sm-3 control-label">ID</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" name="buyerId" readonly />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">采购员代码</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" name="buyerCode" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-3 control-label">采购员姓名</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" name="buyerName" />
              </div>
            </div>
            <!-- <div class="form-group">
              <label class="col-sm-3 control-label">采购员性别</label>
              <div class="col-sm-5">
                <input type="hidden" id="ao-select2-gender" name="genderId" />
              </div>
            </div> -->
            <div class="row form-group">
              <label class="col-sm-3 control-label">采购员性别</label>
              <div class="col-sm-5" id="radio-area"></div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" onclick="initForm()" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="button" onclick="doSubmit()" class="btn btn-primary">确定</button>
        </div>
      </form>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal -->
</div>

<script src="js/buyer.js"></script>

