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

             <%@ include file="/WEB-INF/views/admin/notice/noticeBoard.jsp"%> 
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
<%--          	 <%@ include file="/WEB-INF/views/admin/main/footer.jsp"%>  --%>
          <!-- partial -->
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