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
<title>Admin Page</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%@include file="../component/css.jsp"%>

	


	<div class="container p-5">
		<p class="text-center fs-3">
			<b>Admin Dashboard</b>
		</p>
		<c:if test="${not empty sucMsg}">
			<p class="text-center text-success fs-5">${sucMsg}</p>
			<c:remove var="sucMsg" scope="session" />
		</c:if>

		<c:if test="${not empty errorMsg}">
			<p class="text-center text-danger fs-5">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>
		<%DoctorDao dao = new DoctorDao(Connection_Database.getConn()); %>

		<div class="row">
			<div class="col-md-4 p-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor<br><%=dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>

			

				<div class="col-md-4 p-4">
					<div class=" card paint-card">
						<div class="card-body text-center text-success">
							<i class="fas fa-user-circle  fa-3x"></i><br>
							<p class="fs-4 text-center">
								Users<br><%=dao.countUser()%>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 p-4">
					<div class=" card paint-card">
						<div class="card-body text-center text-success">
							<i class="fas fa-calendar-check  fa-3x"></i><br>
							<p class="fs-4 text-center">
								Total Appointment<br><%=dao.countAppointment() %>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4 p-4">
					<div class=" card paint-card" data-bs-toggle="modal"
						data-bs-target="#exampleModal">
						<div class="card-body text-center text-success">
							<i class="fas fa-solid fa-feather  fa-3x"></i><br>
							<p class="fs-4 text-center">
								Specialist<br><%=dao.countSpecialist() %>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<form action="../addSpecialist" method="post">
							<div class="form-group">
								<label>Enter Specialist Name</label> <input type="text"
									name="specName" class="form-control">
							</div>
							<div class="text-center mt-3">
								<button type="submit" class="btn btn-primary">Add</button>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>

					</div>
				</div>
			</div>
		</div>
</body>
</html>