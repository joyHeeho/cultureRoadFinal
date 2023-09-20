<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%> 

	<script type="text/javascript">
	$(function(){
		$("#adminLogout").click(function(){
			location.href = "/admin/logout"
		})
	})
		
	</script>

 </head>
  <body>

		
<c:if test="${not empty adminLogin }">
     <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 d-flex flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
<!--           <a class="navbar-brand brand-logo" href="/admin/main"><img src="/resources/main/image/logo.png" alt="logo"/></a> -->
<!--           <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo-mini.svg" alt="logo" /></a> -->
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
<!--           <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize"> -->
<!--             <span class="mdi mdi-menu"></span> -->
<!--           </button> -->
          <div class="search-field d-none d-xl-block">
          <!--  검색창 -->
<!--             <form class="d-flex align-items-center h-100" action="#"> -->
<!--               <div class="input-group"> -->
<!--                 <div class="input-group-prepend bg-transparent"> -->
<!--                   <i class="input-group-text border-0 mdi mdi-magnify"></i> -->
<!--                 </div> -->
<!--                 <input type="text" class="form-control bg-transparent border-0" placeholder="Search products"> -->
<!--               </div> -->
<!--             </form> -->
          </div>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <a class="navbar-brand brand-logo" href="/admin/main"><img src="/resources/main/image/logo.png" alt="logo"/></a>
          <ul class="nav">
<!--             <li class="nav-item nav-category">Main</li> -->
            <li class="nav-item">
              <a class="nav-link" href="/admin/main">
                <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                <span class="menu-title">Dashboard</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/notice/board">
                <span class="icon-bg"><i class="mdi mdi-contacts menu-icon"></i></span>
                <span class="menu-title">공지게시판 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <span class="icon-bg"><i class="mdi mdi-format-list-bulleted menu-icon"></i></span>
                <span class="menu-title">Q&A게시판 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/movie/mvBoard/">
                <span class="icon-bg"><i class="mdi mdi-format-list-bulleted menu-icon"></i></span>
                <span class="menu-title">영화게시판 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/admin/reply/all">
                <span class="icon-bg"><i class="mdi mdi-chart-bar menu-icon"></i></span>
                <span class="menu-title">댓글 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="pages/tables/basic-table.html">
                <span class="icon-bg"><i class="mdi mdi-table-large menu-icon"></i></span>
                <span class="menu-title">한줄평 관리</span>
              </a>
            </li>
             <li class="nav-item">
              <a class="nav-link" href="pages/tables/basic-table.html">
                <span class="icon-bg"><i class="mdi mdi-table-large menu-icon"></i></span>
                <span class="menu-title">결제 관리</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                <span class="icon-bg"><i class="mdi mdi-lock menu-icon"></i></span>
                <span class="menu-title">User Pages</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.html"> Blank Page </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
                </ul>
              </div>
            </li> 
<!--            <li class="nav-item documentation-link"> -->
<!--               <a class="nav-link" href="http://www.bootstrapdash.com/demo/connect-plus-free/jquery/documentation/documentation.html" target="_blank"> -->
<!--                 <span class="icon-bg"> -->
<!--                   <i class="mdi mdi-file-document-box menu-icon"></i> -->
<!--                 </span> -->
<!--                 <span class="menu-title">Documentation</span> -->
<!--               </a> -->
<!--             </li> -->

            
            <li class="nav-item sidebar-user-actions">
              <div class="sidebar-user-menu">
                <a href="/admin/logout" class="nav-link"><i class="mdi mdi-logout menu-icon"></i>
                  <span class="menu-title">Log Out</span></a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- partial -->
		<div class="main-panel"> 
             <%@ include file="/WEB-INF/views/admin/notice/noticeBoard.jsp"%> 
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%--          	 <%@ include file="/WEB-INF/views/admin/main/footer.jsp"%>  --%>
          <!-- partial -->
        </div>
		</div>
	</c:if>
        
        <!-- main-panel ends -->
      <!-- page-body-wrapper ends -->
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/resources/adminMain/assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="/resources/adminMain/assets/vendors/chart.js/Chart.min.js"></script>
    <script src="/resources/adminMain/assets/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <script src="/resources/adminMain/assets/js/jquery.cookie.js" type="text/javascript"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="/resources/adminMain/assets/js/off-canvas.js"></script>
    <script src="/resources/adminMain/assets/js/hoverable-collapse.js"></script>
    <script src="/resources/adminMain/assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="/resources/adminMain/assets/js/dashboard.js"></script>
    <!-- End custom js for this page -->
	<c:if test="${empty adminLogin}">
			<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
	</c:if>
	</body>
</html>