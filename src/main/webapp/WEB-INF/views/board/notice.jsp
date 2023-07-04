<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${notice}" var="notice">
	<td>${notice.boardNum}</td>
	<td>
		<a href="./detail?boardNum=${notice.boardNum}">${notice.boardTitle} <b>[${notice.boardCommentCount}]</b></a>
	</td>
	<td>관리자</td>
	<td>${notice.boardDate}</td>
	<td>${notice.boardHit}</td>
</c:forEach>