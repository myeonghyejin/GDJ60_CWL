<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.memberId eq null}">
	<script>
		alert("로그인 후 이용할 수 있습니다");
		location.href = "/member/memberLogin";
	</script>
</c:if>