<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   import = "jeju.user.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 
<c:set var="email" var="${session.getAttribute('email')}" />
 --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <link rel="stylesheet" href="assets/css/custom_header.css" />
    <link rel="stylesheet" href="assets/css/theme-colors/orange.css" />
</head>
<body>
<div class="wrapper page-option-v1">
    <!--=== Header ===-->    
    <div class="header">
        <div class="container">
            <!-- Logo -->
            <a class="logo" href="main.do">
                <img src="http://106.10.39.121:8080/Imgs/main.jpg" alt="Logo" width="150"/>
                <!-- <img src="https://i.ibb.co/6HtB73n/main.jpg" alt="Logo" width="150"/> -->
            </a>
            <!-- End Logo -->
            
            <!-- Topbar -->
            <div class="topbar">
                <ul class="loginbar pull-right">
                <c:if test="${name != null && name !='관리자'}" >
                	<!-- 일반유저 -->
                    <li>${name}님 </li>
<c:if test="${activate == 'Y' }">
                    <li class="dropdown top">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                            My page
                        </a>
                        <ul class="dropdown-menu top">
		                    <li><a href="mypage.do">My page</a></li>
		                    <li><a href="mypage.do">My page</a></li>
		                    <li><a href="mypage.do">My page</a></li>
                            <!-- End 마이페이지 -->
                         
                        </ul>
                    </li>
</c:if>
<c:if test="${activate == 'N' }">
                    <li><a href="activate.do">이메일 인증</a></li>
</c:if>
                    <li class="topbar-devider"></li>
                    <li><a href="logout.do">Logout</a></li>
                </c:if>
                <c:if test="${name != null && name =='관리자'}" >
                	<!-- 관리자 -->
                    <li>${name}님 </li>
                    <li class="topbar-devider"></li>
                    <li><a href="logout.do">Logout</a></li>
                </c:if>
                <c:if test="${empty name}" >
                	<!-- 로그인ㄴㄴ -->
                    <li><a href="login.do">Login</a></li>
                    <li class="topbar-devider"></li>
                    <li><a href="registerform.do">Join</a></li>
                </c:if>
                </ul>
            </div>
            <!-- End Topbar -->

        </div><!--/end container-->
<c:if test="${activate == 'Y' }">
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse mega-menu navbar-responsive-collapse" id="JEJU">
            <div class="container">
                <ul class="nav navbar-nav">
                    <!-- Home -->
                    <li class="dropdown maintop">
                        <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown">
                            우리의 제주
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="index.html">사이트 소개</a></li>
                            <li><a href="index.html">이용안내</a></li>
                            <li><a href="index.html">SOMETHING</a></li>
                            <!-- End 사이트 소개 -->
                         
                        </ul>
                    </li>
                    <!-- End 우리의 제주 -->

                    <!-- 여행 -->                    
                    <li><a href="planList.do">여행 일정</a></li>
                    <!-- End 여행일정 -->

                    <!-- 동행 -->
                    <li><a href="findList.do">동행 찾기</a></li>
                    <!-- End 동행 -->

                    <!-- 리뷰 -->
                    <li><a href="review.do">리뷰</a></li>
                    <!-- End 리뷰 -->
                    

                    <!-- 공지 -->
                    <li><a href="noticeList.do">공지사항</a></li>
                    <!-- End 공지 -->
                    
                </ul>
            </div><!--/end container-->
        </div><!--/navbar-collapse-->
        
            <!-- Toggle get grouped for better mobile display -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#JEJU">
                <span class="sr-only">Toggle navigation</span>
                <span class="fa fa-bars"></span>
            </button>
            <!-- End Toggle -->
</c:if>
    </div>
    <!--=== End Header ===-->
   </div>
   

</body>
</html>