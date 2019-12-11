<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="modal-header">
	<h4 class="modal-title">${company.company_title}</h4>
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true">&times;</button>
</div>

<div class="modal-body">
	<div class="modal-info">
		<ul class="list-inline grid-boxes-news">
			<li><span>By</span> <a href="#">${company.user_nickname }</a></li>
			<li>|</li>
			<li><i class="fa fa-clock-o"></i>&nbsp;<fmt:formatDate
					value="${company.company_date}" timeStyle="medium"
					pattern="yyyy-MM-dd" /></li>
			<li>|</li>
			<li class="company_count"><i class="fa fa-comments-o"></i>
				${company.company_count }</li>
		</ul>

		<c:if test="${company.user_nickname == name}">
			<ul class="list-inline grid-boxes-news">
				<li><a href="findUpdate.do?company_no=${company.company_no}"
					class="trigger-btn" data-toggle="modal"> 수정</a></li>
				<li>|</li>
				<li><a onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="findDeletePro.do?company_no=${company.company_no}">삭제</a></li>
			</ul>
		</c:if>
	</div>

	<div class="form-group">
		<table class="modal-content-table">
			<tr class="fontsize">
				<td class="date">여행기간</td>
				<td width="70%"><span class="start">${company.company_startdate }</span><span
					class="end">${company.company_enddate }</span></td>
			</tr>

			<tr class="fontsize">
				<td colspan="2" height="250px" style="vertical-align: top">
					<p style="white-space: pre-line">
						<c:out value="${company.company_content }" />
					</p>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<button class="btn-u btn-u-dark-blue btn-xs">
						#
						<c:if test="${company.company_gender eq 'M'}">남성</c:if>
						<c:if test="${company.company_gender eq 'W'}">여성</c:if>
						<c:if test="${company.company_gender eq 'N'}">남여동행</c:if>
					</button>
					<button class="btn-u btn-u-yellow btn-xs">#
						${company.company_theme }</button>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="padding-top-0">
					<c:forEach var="tag" items="${tags }">
						<button class="btn-u btn-u-green btn-xs"># ${tag}</button>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>

	<!--  
				<div class="form-group">
					<button type="button" class="btn btn-primary btn-lg btn-block login-btn"  data-toggle="modal" data-target="#myModal2-1">쪽지보내기</button>
				</div>
				-->
</div>