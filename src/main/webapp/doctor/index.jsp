<%@page import="com.entity.Doctor"%>
<%@page import="com.connection.Connection_Database"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
<c:if test="${empty doctObj }">
<c:redirect url="../doctor_login.jsp"></c:redirect>

</c:if>

	<%@ include file="../component/css.jsp"%>
	<%@ include file="navbar.jsp"%>
	<br><br>
	
	<p class="text-center fs-3 "><b>Doctor Dashboard</b></p> 
	<div class="container p-5">
	<div class="row">
	<%
	Doctor d=(Doctor)session.getAttribute("doctObj");
	DoctorDao dao = new DoctorDao(Connection_Database.getConn()); %>
	<div class="col-md-4 offset-md-2">
					<div class=" card paint-card">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-circle  fa-3x"></i><br>
							<p class="fs-4 text-center">
								Users<br><%=dao.countDoctor() %>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 ">
					<div class=" card paint-card">
						<div class="card-body text-center text-success">
							<i class="fas fa-calendar-check  fa-3x"></i><br>
							<p class="fs-4 text-center">
								Total Appointment<br><%=dao.countAppointmentByDoctorId(d.getId()) %>
							</p>
						</div>
					</div>
				</div>
	</div>
	</div>
</body>
</html>