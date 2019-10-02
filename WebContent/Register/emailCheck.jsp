<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 여기 관련된 Action을 만들어서 처리하고  --%>
<c:if test="${check == 0 }">
<span class="text-green">
	사용가능합니다
</span>
</c:if>
<c:if test="${check == 1 }">
<span class="error">
	이미 사용중인 이메일입니다
</span>
</c:if>