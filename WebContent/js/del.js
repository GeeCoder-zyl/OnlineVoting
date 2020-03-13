function del(vsId) {
	if (confirm("确认删除？")) {
		var tr = document.getElementById(vsId);
		console.log(vsId);
		$.ajax({
			type : 'GET',
			url : 'DelVoteServlet?vsId=' + vsId,
			success : function(data) {
				tr.remove();
				alert("删除成功！");
			},
			error : function(data) {
				alert("删除失败！");
			},
		});
	}
}
