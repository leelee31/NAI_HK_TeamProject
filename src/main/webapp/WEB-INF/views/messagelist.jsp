<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/hj/messagelist.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<input type="hidden" id="rec" value="${n_receiver}" >
	<table border="0">
			<tr>
				<th>쪽지번호</th>
				<th>수신자</th>
				<th>발신자</th>
				<th>쪽지날짜</th>
				<th>내용</th>
				<th>쪽지코드</th>
			</tr>
		<c:choose>
			<c:when test="${empty list}">
				<tr><td colspan="6">---작성된 글이 없습니다.---</td></tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="dto">
					<tr>
						<td>${dto.n_seq}</td>
						<td>${dto.n_receiver}</td>
						<td>${dto.n_sender}</td>
						<td>${dto.n_time}</td>
						<td><a href="getMessage.do?n_seq=${dto.n_seq}">${dto.n_content}</a></td>
						<td>${dto.ns_state_code}</td>
						<td><a id="delete" href="deleteMessage.do?n_seq=${dto.n_seq}&n_receiver=${sessionScope.member.id}">삭제</a></td>		
						<input type="hidden" id="session" value="${dto.n_receiver}" >
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>