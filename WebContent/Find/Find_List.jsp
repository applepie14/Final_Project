<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<title>그날, 우리의 제주</title>
    <!-- Meta -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico" />

    <!-- Web Fonts -->
    <link rel='stylesheet' type='text/css' href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin' />

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/style.css" />

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="assets/css/headers/header-default.css" />
    <link rel="stylesheet" href="assets/css/footers/footer-v1.css" />

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="assets/plugins/animate.css" />
    <link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
    <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css" />
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
    <link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings.css" type="text/css" media="screen" />
    
    
    <link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/css/sky-forms.css" />
	<link rel="stylesheet" href="assets/plugins/sky-forms-pro/skyforms/custom/custom-sky-forms.css" />
    <!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->
    
    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="assets/css/pages/page_clients.css" />

    <!-- CSS Customization -->
    <link rel="stylesheet" href="assets/css/custom_find.css" />
    <link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
    

</head>

<body>    
<%@include file="../header.jsp" %>


<!-- 기본 페이지 이 아래로 합치면 됨 -->
<div class="wrapper">

    <!--=== Breadcrumbs ===-->
    <div class="breadcrumbs-v1">
        <div class="container">
            <span>Look for Companion</span>
            <h1>동행 찾기</h1>
        </div><!--/container-->
    </div><!--/breadcrumbs-v1-->
    
    <div class="breadcrumbs">
        <div class="container">
   	 		<ul class="pull-right breadcrumb">
        		<li><a href="findWrite.do">동행 찾기 등록</a></li>
   			</ul>
        </div><!--/container-->
    </div><!--/breadcrumbs-->
    
    
    
    <!--=== Content Part ===-->
    <div class="container content">		
        	<div class="col-md-9 findlist">
				
						<!-- Clients Block-->
						<c:if test="${pgList.count==0 }">
							<table class="table">
								<tr>
									<td align="center">게시판에 저장된 글이 없습니다.</td>
								</tr>
							</table>
						</c:if>
				<!--Basic Table-->
                <table class="table">
                    <thead>
                        <tr text-align="center">
                            <th class="find-num" width="10%">글번호</th>
                            <th width="23%">여행 기간</th>
                            <th width="40%">글제목</th>
                            <th width="15%">작성자</th>
                            <th class="find-date" width="20%">작성일</th>
                        </tr>
                    </thead>
                    

                    <!-- 실질적으로 레코드를 출력시켜주는 부분 -->
					<tbody>
						<c:set var="number" value="${pgList.number }" />
						<c:forEach var="company" items="${companyList }">
				
							<tr>
								<td class="find-num" ><!-- 글번호 -->
									<c:out value="${number}" /> 
									<c:set var="number" value="${number-1 }" />
								</td>

								<td><!-- 여행기간 -->
									<span class="Liststart">${company.company_startdate }</span>
									<span class="Listend">${company.company_enddate }</span>
								</td>

								<td class="h"><!-- 글 제목 -->
									<a href="#myModal${company.company_no }" class="trigger-btn" data-toggle="modal">
										${company.company_title}
									</a>
								</td>

								<td>${company.user_nickname }</td>
								<td class="find-date"><fmt:formatDate
										value="${company.company_date}" timeStyle="medium"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
						</tbody>


				</table>
                <!--End Basic Table-->
            
            	<form name="test" class="search" action="findList.do">
					<select class="searchlist" name="search">
						<option value="all">전체</option>
						<option value="Company_Title">제목</option>
						<option value="title_content">제목+본문</option>
						<option value="User_Nickname">작성자</option>
					</select>
					&nbsp;
					<input type="text" class="searchtext" size="15" name="searchtext" placeholder="&nbsp;검색어를 입력하세요" >&nbsp;
					<input class="searchbutton btn-u" type="submit" value="검색">
				</form><p>
            
                <!-- End Clients Block-->

                <!-- 페이징 처리 -->
                <div class="pagination1">
                <ul class="pagination">
                	<li>
                		<c:if test="${pgList.startPage > pgList.blockSize }">
							<a href = "findList.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="before_next"><font>◀</font></a>
						</c:if>
					</li>
		
					
				 <c:forEach var="i" begin="${pgList.startPage}"  end="${pgList.endPage}">
                     <c:if test="${pgList.currentPage==i }">
                        <li class="active">
                           <a href="findList.do?pageNum=${i }&search=${search}&searchtext=${searchtext}" class="paging_now active">
                              <font>${i }</font>
                           </a>
                        </li>                     
                     </c:if>
                     <c:if test="${pgList.currentPage !=i }">
                        <li class="">
                           <a href="findList.do?pageNum=${i }&search=${search}&searchtext=${searchtext}" class="paging_now active">
                              <font>${i }</font>
                           </a>
                        </li>                     
                     </c:if>
                  </c:forEach>
					
					
					<li>
						<c:if test="${pgList.endPage < pgList.pageCount}">
							<a href = "findList.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="before_next"><font>▶</font></a>
						</c:if>
					</li>
				</ul>
				</div>
                <!-- End Pagination -->
            </div><!--/col-md-9-->
        </div>
    </div>
        
        
    
<c:forEach var="company" items="${companyList }">
<!-- 글 상세보기 Modal -->
<div id="myModal${company.company_no }" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
		
			<div class="modal-header">
				<h4 class="modal-title">${company.company_title}</h4>	
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			
			<div class="modal-body">
				<div class="modal-info">
					<ul class="list-inline grid-boxes-news">
                        <li><span>By</span> <a href="#">${company.user_nickname }</a></li>
                        <li>|</li>
                        <li><i class="fa fa-clock-o"></i><fmt:formatDate value="${company.company_date}" timeStyle="medium" pattern="yyyy-MM-dd" /></li>
                        <li>|</li>
                        <li><i class="fa fa-comments-o"></i> 조회수 ${company.company_count }</li>
                    </ul>
                    
                <c:if test="${company.user_nickname == name}" >
                    <ul class="list-inline grid-boxes-news">
                        <li><a href="#myModal1-1" class="trigger-btn" data-toggle="modal"> 수정</a></li>
                        <li>|</li>
                        <li><a href="#">삭제</a></li>
                    </ul>
                </c:if>
        		</div> 
				
				<div class="form-group">
					<table class="modal-content-table">
						<tr>
							<td class="date">여행기간</td>
							<td width="70%"><span class="start">${company.company_startdate }</span><span class="end">${company.company_enddate }</span></td>
						</tr>
						<tr>
							<td colspan="2">
							<p>${company.company_content}</p>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="#">#나홀로</a>
								<a href="#">#남자</a>
								<a href="#">#식도락</a>
								<a href="#">#액티비티</a>
							</td>
						</tr>
					</table>
				</div>

				<div class="form-group">
					<button type="button" class="btn btn-primary btn-lg btn-block login-btn"  data-toggle="modal" data-target="#myModal2">쪽지보내기</button>
				</div>
			</div>
		</div>
	</div>
</div>
</c:forEach>





<!-- 글 수정 Modal -->

<div id="myModal1-1" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
		
			<div class="modal-header">
				<h4 class="modal-title"><input type="text" class="UpdateTitle" value="여행가고싶어요~~"></input></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			
			<div class="modal-body Update">

				<div class="form-group">
					<table class="modal-content-table">
						<tr>
							<td class="UpdateDate">여행기간</td>
							<td class="UpdateDate1">
							<span class="start">
								<input type="text" name="start" class="Updatestart" id="start" value="2019-09-23">
							</span>
							~
							<span class="finish">
								<input type="text" name="finish" class="Updateend" id="finish" value="2019-10-12">
							</span></td>
							
							
						</div>
						</tr>
						<tr>
							<td colspan="2">
							<textarea class="UpdateContent" rows="5">제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							제주여행사이트제주여행사이트제주여행사이트제주여행사이트
							</textarea>
							</td>
						</tr>
					</table>
					<table class="modal-content-table UpdateTag">
					<tr>
						<td class="rowspan"> 관심 태그 </td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox"><i></i>식도락</td>
						<td><input type="checkbox" name="checkbox"><i></i>액티비티</td>
						<td><input type="checkbox" name="checkbox"><i></i>휴양</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox"><i></i>취미</td>
						<td><input type="checkbox" name="checkbox"><i></i>쇼핑</td>
						<td><input type="checkbox" name="checkbox"><i></i>공연,예술</td>
						<td><input type="checkbox" name="checkbox"><i></i>명소</td>
					</tr>
					<tr><td><p></td></tr>
					<tr>
						<td class="rowspan"> 여행 테마 </td>
					</tr>
					<tr>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>나홀로</td>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>가족</td>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>커플</td>
					</tr>
					<tr>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>단체</td>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>친구</td>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>비지니스</td>
					</tr>
					<tr><td><p></td></tr>
					<tr>
						<td class="rowspan"> 성별 </td>
					</tr>
					<tr>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>남자</td>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>여자</td>
						<td><input type="radio" name="radio"><i class="rounded-x"></i>상관없음</td>
					</tr>
					</table>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-lg btn-block login-btn">수정</button>
				</div>
			</div>
		</div>
	</div>
</div>     


<!-- 쪽지 전송 Modal -->

<div id="myModal2-1" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
		
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			
			<div class="modal-body Update">

				<div class="form-group">
					<table class="modal-content-table">
						<tr>
							<td class="SendWriter">작성자</td>
							<td>홍길동씨</td>
						</tr>
						<tr>
							<td class="SendTitle">글제목</td>
							<td>여행가고싶어요~~</td>
						</tr>
						<tr>
							<td colspan="2">
							<textarea class="SendContent" rows="12"></textarea>
							</td>
						</tr>
					</table>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-primary btn-lg btn-block login-btn">전송</button>
				</div>
			</div>
		</div>
	</div>
</div>     


<%@include file="../footer.jsp" %>
</div><!--/wrapper-->

<!-- JS Global Compulsory -->			
<script type="text/javascript" src="assets/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="assets/plugins/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.maskedinput.min.js"></script>
<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery-ui.min.js"></script>
<script src="assets/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
<!-- JS Customization -->
<script type="text/javascript" src="assets/js/custom.js"></script>
<!-- JS Page Level -->           
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/plugins/masking.js"></script>
	<script type="text/javascript" src="assets/js/plugins/datepicker.js"></script>
	<script type="text/javascript" src="assets/js/plugins/validation.js"></script>	
	<script type="text/javascript">
    	jQuery(document).ready(function() {
        	App.init();
        	Masking.initMasking();
        	Datepicker.initDatepicker();
        	Validation.initValidation();
        });
	</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>