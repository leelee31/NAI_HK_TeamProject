//뒤로가기 눌렀을때 메인으로 돌아가기
history.pushState(null, null, location.href); 
$(window).on('popstate',function(){
	location.href="main.do";
});
		
$(document).ready(function(){
	var frm = $('#commentForm');
	frm.submit(function (e) {
	    e.preventDefault();
	    $.ajax({
	        type: frm.attr('method'),
	        url: frm.attr('action'),
	        data: frm.serialize(),
	        success: function (data) {
	            console.log('Submission was successful.');
	        	var cmt = data.dto;
		       	if(cmt.ac_comment != 'false'){
		       		$('#comment').append('<tr><td>'
		       				+ cmt.ac_name+" "
		       				+cmt.m_id+" "
		       				+cmt.ac_comment+" "
		       				+parseFloat(cmt.ac_score).toFixed(1) 
		       				+'</td></tr>');
		       	}else{
		       		alert('등록한 학원이 다르거나, 이미 학원평을 작성했습니다.');
		       	}
	        },
	        error: function (data) {
	            console.log('An error occurred.');  
	        },
	    });
	}); 
	
	$('#bk').click(function() {
		var id = $('#session').val();
		var ac_name = $('#ac_name').text();
		$.ajax({
			type: "get",
			url: "putBasket.do",
			traditional:true,
			data:{"baskId":id, "baskAcademyName":ac_name},
			datatype:"json",
			success: function (data) {
				alert('장바구니에 추가되었습니다.')
				console.log('성공');
			},
			error: function (data) {
				console.log('실패');
			},
		});
	});
});