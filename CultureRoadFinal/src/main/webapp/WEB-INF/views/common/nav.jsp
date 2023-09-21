<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style>
.header-area {
   background-color:#212741;
}

.header-sticky {
   background-color: #212741;
}

.nav{
    display: block;
    font-weight: 300;
    font-size: 14px;
    text-transform: capitalize;
    color: #fff;
    -webkit-transition: all 0.3s ease 0s;
    -moz-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
    height: 40px;
    line-height: 40px;
    border: transparent;
    letter-spacing: 1px;
}

nav li a {
    display: block;
   font-weight: 300;
    font-size: 14px;
    text-transform: capitalize;
    color: #fff;
    -webkit-transition: all 0.3s ease 0s;
    -moz-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
    height: 40px;
    line-height: 40px;
    border: transparent;
    letter-spacing: 1px;
}


</style>
</head>
<body>

   <!-- ***** Header Area Start ***** -->
   <header class="header-area header-sticky">
      <div class="container">
         <div class="row">
            <div class="col-12">
               <nav class="main-nav">
                  <!-- ***** Logo Start ***** -->
                  <div class="logo">
                     <img src="/resources/main/image/logo.png" alt="">
                  </div>
                  <!-- ***** Logo End ***** -->
                  <!-- ***** Menu Start ***** -->
                  <ul class="nav">
                     <li class="scroll-to-section"><a href="/" class="active">Main</a></li>
                     <li class="has-sub">Movie
                        <ul class="sub-menu" >
                           <li><a href="">Movie List</a></li>
                           <li><a href="/movie/mvBoard">Movie Board</a></li>
                           <li><a href="">Reservation</a></li>
                        </ul>
                     </li>

                     <li class="has-sub">Notice
                        <ul class="sub-menu" class="active">
                           <li><a href="/notice/list">Notice</a></li>
                           <li><a href="/qna/qnaClient">Q&A</a></li>
                        </ul>
                     </li>

                     <c:choose>
                        <c:when test="${empty userLogin}">
                           <li><a href="/userLogin/signUpForm">회원가입</a></li>
                           <li><a href="/userLogin/loginUser">로그인</a></li>
                        </c:when>
                        <c:when test="${not empty userLogin}">
                           <li><a href="/userLogin/myPage">마이페이지</a></li>
                           <li><a href="/userLogin/logout">로그아웃</a></li>
                        </c:when>
                     </c:choose>
                  </ul>

               </nav>
            </div>
         </div>
      </div>
   </header>
   <!-- ***** Header Area End ***** -->