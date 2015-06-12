var buyerForm;
//var genderSelect;
var genderData = $.parseJSON($.ajax({
    url : "gender/list",
    async : false
}).responseText);

function initRadios() {
    var radioHtml = '';
    for ( var i in genderData) {
        radioHtml += '<div class="radio-inline"><label>' + '<input type="radio" name="genderId" value="'
                + genderData[i].genderId + '"' + (i == 0 ? ' checked' : '') + '>' + genderData[i].genderName
                + '<i class="fa fa-circle-o small"></i>' + '</label></div>';
    }
    $('#radio-area').html(radioHtml);
}

function showModal() {
    $('#myModal').modal('show');
}

function initForm() {
    buyerForm.clearForm();
    buyerForm.resetForm();
//    genderSelect.select2('val', '');
//    genderSelect.trigger("change");
}

function create() {
    $("#myModalLabel").html("新增采购员");
    showModal();
}

function update(id) {
    $("#myModalLabel").html("更新采购员");
    var htmlobj = $.ajax({
        url : "buyer/retrieve/" + id,
        async : false
    });
    var jsonCotent = $.parseJSON(htmlobj.responseText);
    // return a json to fill the form.
    buyerForm.autofill(jsonCotent);
//    genderSelect.trigger("change");
    showModal();
}

function del(id) {
    $.ajax({
        url : "buyer/delete/" + id,
        type : "POST",
        async : false,
        success : function() {
            alert("Success!");
        },
        error : function() {
            alert("Error!");
        }
    });
    $('#tb').bootstrapTable('refresh');
}

function doSubmit() {
    buyerForm.submit();
}

function actionFormatter(value, row, index) {
    return '<div class="btn-group   btn-group-sm" role="group" aria-label="...">'
            + '<button type="button"  onclick=update(' + value + ') class="btn btn-default">修改</button>'
            + '<button type="button" onclick=del(' + value + ') class="btn btn-default ">删除</button>' + '</div>';
}

function showRequest() {
    if ($('#defaultForm').data('bootstrapValidator').isValid()) {
    } else {
        return false;
    }
    $('.loading').show();
}

function showResponse() {
    $('#tb').bootstrapTable('refresh');
    $('.loading').hide();
    alert('success');
    $('#myModal').modal('hide');
    initForm();
}

function showError() {
    $('.loading').hide();
    alert('error');
}

/*
function makeSelect2() {
    $('#ao-select2-gender').select2({
        placeholder : "--- 请选择 ---",
        data : $.map(genderData, function(item) {
            return {
                id : item.genderId,
                text : item.genderName
            };
        })
    });
    genderSelect = $('#ao-select2-gender');
}
*/

$(document).ready(function() {

    $('#tb').bootstrapTable();

    buyerForm = $("#defaultForm").ajaxForm({
        beforeSubmit : showRequest,
        success : showResponse,
        error : showError,
        // dataType : null,
        clearForm : true,
        resetForm : true,
        timeout : 6000
    });

    initRadios();

    LoadBootstrapValidatorScript(configure_val);
    LoadSelect2Script(makeSelect2);

});