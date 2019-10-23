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
<meta name="viewport" content="widt\h=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="" />

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" />
<!-- Web Fonts -->
<link rel='stylesheet' type='text/css'
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,600&amp;subset=cyrillic,latin' />

<!-- CSS Global Compulsory -->
<link rel="stylesheet"href="assets/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/style.css" />

<!-- CSS Header and Footer -->
<link rel="stylesheet" href="assets/css/headers/header-default.css" />
<link rel="stylesheet" href="assets/css/footers/footer-v1.css" />

<!-- CSS Implementing Plugins -->
<link rel="stylesheet" href="assets/plugins/animate.css" />
<link rel="stylesheet" href="assets/plugins/line-icons/line-icons.css" />
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" href="assets/plugins/fancybox/source/jquery.fancybox.css" />
<link rel="stylesheet"href="assets/plugins/owl-carousel/owl-carousel/owl.carousel.css" />
<link rel="stylesheet"href="assets/plugins/revolution-slider/rs-plugin/css/settings.css"type="text/css" media="screen" />
<!--[if lt IE 9]><link rel="stylesheet" href="assets/plugins/revolution-slider/rs-plugin/css/settings-ie8.css" type="text/css" media="screen"><![endif]-->

<!-- CSS Customization -->
<link rel="stylesheet" href="assets/css/custom_notice.css" />
<link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
<style>
hr {
	margin: 3px 0;
}
 /*  .pagination {
    display: inline-block;
    padding-left: 0;
    margin: 40px 0;
    border-radius: 4px;
}  
 */
span {color:gray;
      font-size:24px;}

.breadcrumbs-v1-list h1 {
    font-size: 50px;
    line-height: 35px;
    color:gray;
}
.pagination1,
form.search{
	text-align : center;
}

input.searchbutton.btn-u {
    vertical-align: middle;
    height: 25px;
    padding-top : 2px;
}

</style>
</head>
<body>
	<%@include file="../header.jsp"%>


	<!-- 기본 페이지 이 아래로 합치면 됨 -->
	<!--=== Breadcrumbs v1 ===-->
	<form action="assets/php/demo-contacts-process.php" method="post" id="sky-form3" class="sky-form">
	<div class="breadcrumbs-v1-list">
		<div class="container">
			<span>Notic Page</span>
			 <h1>공지사항</h1>
		</div>
	</div>
	<!--=== End Breadcrumbs v1 ===-->
    <div class="breadcrumbs">
        <div class="container">
   	 		<ul class="pull-right breadcrumb">
        		<li><a href="noticeWrite.do">공지 작성</a></li>
   			</ul>
        </div><!--/container-->
    </div>

	<!--=== Content Part ===-->
  <fieldset>
	<div class="notice-container">
	
		<!-- Clients Block-->

  <table class="table">
    <thead>
      <tr>
        <th class="notice-num" width="25%">글번호</th>
        <th width="50%">글제목</th>
        <th class="notice-date" width="25%">작성일</th>
      </tr>
    </thead>
    
    <!-- 실질적으로 레코드를 출력시켜주는 부분 -->
    <tbody>
   <c:if test="${pgList.count==0 }">
    <table class="table"> 
       <tr>
         <td align="center">게시판에 저장된 글이 없습니다.</td>
		</tr>
	</table>
   </c:if>
       <c:set var="number" value="${pgList.number }" />
	<c:forEach var="notice" items="${noticeList}">
  <tr>
    <td class="find-num" ><!-- 글번호 -->
	<c:out value="${number}" /> 
	<c:set var="number" value="${number-1 }" />
	</td>
   

<%--         <td><a href="noticeDetail.do?num=${article.num}"><c:out value="${notice.notice_title}"/></a></td> --%>
        <td><a href="noticeDetail.do?notice_no=${notice.notice_no}"><c:out value="${notice.notice_title}"/></a></td>
  
        <%-- 	<c:out value="${number}"/>
 --%>      		<%-- <c:set var="number" value="${number-1 }"/> --%>
		

        <td><fmt:formatDate value="${notice.notice_date}" timeStyle="medium" 
                       pattern="yy-MM-dd "/>  </td>
     </tr>
  </c:forEach>
    </tbody>
  </table>
  	</div>
	</fieldset>
</form>
  
    <!--End Basic Table-->
            
   	<form name="test" class="search" action="noticeList.do">
	<select name="search">
  
        <option value="title_content">제목+본문</option>
		<option value="Notice_Title">제목</option>
        <option value="Notice_Date">작성일</option>
		
	</select>
	&nbsp;
	<input type="text" size="15" name="searchtext" placeholder="&nbsp;검색어를 입력하세요" style="width :300px" >&nbsp;
    <input class="searchbutton btn-u" type="submit" value="검색">
</form><p>
        



	<!-- Pagination -->
	<!-- <div class="text-center md-margin-bottom-30">
		<ul class="pagination">
			<li><a href="#">«</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li class="active"><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">»</a></li>
		</ul>
	</div> -->
	
	
	
	
	
	<!-- 페이징 처리 -->
<div class="pagination1">
  <ul class="pagination">
  	<li>
  		<c:if test="${pgList.startPage > pgList.blockSize }">
        <a href = "noticeList.do?pageNum=${pgList.startPage-pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="before_next"><font>◀</font></a>
        </c:if>
   </li>

  <li>
	<c:forEach var="i" begin="${pgList.startPage}"  end="${pgList.endPage}">
    <a href="noticeList.do?pageNum=${i}&search=${search}&searchtext=${searchtext}" class="paging_now">
    <c:if test="${pgList.currentPage==i }">
    <font class="sel"><b>${i }</b></font>
    </c:if>


    <c:if test="${pgList.currentPage!=i }">
    <font><b>${i }</b></font>
    </c:if>
    </a>	
    </c:forEach>
  </li>

  <li>
	<c:if test="${pgList.endPage < pgList.pageCount}">
    <a href = "noticeList.do?pageNum=${pgList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}" class="before_next"><font>▶</font></a>
    </c:if> 
  </li>
</ul>
	</div>
	
<%--  <c:if test="${noticeList.startPage > noticeList.blockSize }">
  	<a href="noticelist.do?pageNum=${noticeList.startPage-noticeList.blockSize}&search=${search}&searchtext=${searchtext}">[이전]</a>	
</c:if>		

<c:forEach var="i" begin="${noticeList.startPage}" end="${noticeList.endPage}">
  <a href="noticelist.do?pageNum=${i}&search=${search}&searchtext=${searchtext}">
   <c:if test="${noticeList.currentPage==i}">
     <font color="red"><b>[${i}]</b></font>
   </c:if>
   <c:if test="${noticeList.currentPage!=i}">
     [${i}]
   </c:if>
    </a>
</c:forEach>		
<c:if test="${noticeList.endPage < noticeList.pageCount }">
		<a href="noticelist.do?pageNum=${noticeList.startPage+pgList.blockSize}&search=${search}&searchtext=${searchtext}">[다음]</a>
</c:if>
<p> --%>
	<!-- End Pagination -->

	<!--=== End Content Part ===-->


	<%@include file="../footer.jsp"%>

	<!--/wrapper-->

	<!-- JS Global Compulsory -->
	<script type="text/javascript"
		src="assets/plugins/jquery/jquery.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/jquery/jquery-migrate.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- JS Implementing Plugins -->
	<script type="text/javascript" src="assets/plugins/back-to-top.js"></script>
	<script type="text/javascript" src="assets/plugins/smoothScroll.js"></script>
	<script type="text/javascript" src="assets/plugins/jquery.parallax.js"></script>
	<script type="text/javascript"
		src="assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
	<script type="text/javascript"
		src="assets/plugins/owl-carousel/owl-carousel/owl.carousel.js"></script>
	<script type="text/javascript"
		src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="assets/plugins/revolution-slider/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
	<!-- JS Customization -->
	<script type="text/javascript" src="assets/js/custom.js"></script>
	<!-- JS Page Level -->
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/plugins/fancy-box.js"></script>
	<script type="text/javascript" src="assets/js/plugins/owl-carousel.js"></script>
	<script type="text/javascript"
		src="assets/js/plugins/revolution-slider.js"></script>
	<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        App.initParallaxBg();
        FancyBox.initFancybox();
        OwlCarousel.initOwlCarousel();
        RevolutionSlider.initRSfullWidth();
    });
</script>
	<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
    <script src="assets/plugins/html5shiv.js"></script>
    <script src="assets/plugins/placeholder-IE-fixes.js"></script>
<![endif]-->

</body>
</html>