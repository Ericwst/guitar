/**
 * 用于注册时检查admin是否正确
 * 
 */
	function checkAdmin(form) {
		for (i = 0; i <form.length; i++) {
			if (form.elements[i].value == "") {
				alert("表单信息不能为空");
				return false;
			}
		}
		if (document.form.adminPassword.value != document.form.confirmedPassword.value) {
			window.alert("您两次输入的密码不一致，请重新输入");
			return false;
		}
	}