<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${name == null || name == ''}">
	<script>
		// 로그인 실패
		alert("로그인에 실패했습니다. 로그인 정보를 다시 확인해주세요")
		history.back();
	</script>
</c:if>
<c:if test="${name != null}">
	<c:if test="${activate =='N' }">
		<script>
			//일반 사용자 인증 ㄴㄴ
			location.href = "activate.do"
		</script>
	</c:if>
	<script>
		//일반 사용자 로그인 ㅇㅇ
		location.href = "main.do"
	</script>
</c:if>
<c:if test="${name == '관리자'}">
	<script>
		//관리자 or 일반 사용자 로그인 ㅇㅇ
		location.href = "main.do"
	</script>
</c:if>