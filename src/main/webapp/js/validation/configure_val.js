function configure_val(){ 
	$('#defaultForm').bootstrapValidator({
		message: 'This value is not valid',
		fields: {
			id: {
				message: 'The username is not valid',
				validators: {
					notEmpty: {
						message: '客户ID不能为空'
					},
					stringLength: {
						min: 1,
						max: 50,
						message: '长度必须在1到50之间'
					},
					regexp: {
						regexp: /^[a-zA-Z0-9_]+$/,
						message: '只能是字母数字下划线'
					}
				}
			}, 
		}
	});
}