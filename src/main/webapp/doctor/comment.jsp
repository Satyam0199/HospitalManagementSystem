<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.connection.Connection_Database"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Comment Page</title>
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
	<br>
	<br>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">
							<b>Patient Comment</b>
						</p>
						<% 
						int id= Integer.parseInt(request.getParameter("id"));
						AppointmentDao dao=new AppointmentDao(Connection_Database.getConn());
						Appointment ap=dao.getAppointmentById(id);
						
						%>
						<form class="row" action="../updateStatus" method="post">
							<div class="col-md-6">
								<lable>Patient Name</lable>
								<input type="text" readonly value="<%=ap.getFullName() %>" class="form-control">
							</div>

							<div class="col-md-6">
								<lable>Dob</lable>
								<input type="text" readonly value="<%=ap.getDob() %>" class="form-control">
							</div>

							<div class="col-md-6">
								<lable>Mob No</lable>
								<input type="text" readonly value="<%=ap.getPhNo() %>" class="form-control">
							</div>

							<div class="col-md-6">
								<lable>Diseases</lable>
								<input type="text" readonly value="<%=ap.getDiseases() %>" class="form-control">
							</div>

							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea rows="3" required name="comm" class="form-control"
									cols=""></textarea>
							</div>

							<input type="hidden" name="id" value="<%=ap.getId()%>">
							<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">
							<button class="mt-3 btn btn-success col-md-6 offset-md-3">Submit</button>


						</form>
					</div>


				</div>

			</div>

		</div>


	</div>

</body>
</html>