<%@page import="com.dao.AppointmentDao"%>
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
<title>Insert title here</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>


	<%@ include file="../component/css.jsp"%>
	<%@ include file="navbar.jsp"%>
	<br>
	<br>



	<div class="col-md-15">
		<div class="card  paint-card">
			<div class="card-body">
				<p class=" fs-3 text-center">
					<b>Patient Details</b>
				</p>
				<table class="table">
					<thead>
						<tr>

							<th scope="col">Full Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Dob</th>
							<th scope="col">Appoint Date</th>
							<th scope="col">Email</th>
							<th scope="col">Mob No</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>


						</tr>

					</thead>
					<tbody>
						<%
						AppointmentDao dao = new AppointmentDao(Connection_Database.getConn());
						DoctorDao dao2 = new DoctorDao(Connection_Database.getConn());
						List<Appointment> list = dao.getAllAppointment();
						for (Appointment ap : list) {
							Doctor d = dao2.getDoctorById(ap.getDoctorId());
						%>
						<tr>

							<th><%=ap.getFullName()%></th>
							<td><%=ap.getGender()%></td>
							<td><%=ap.getDob()%></td>
							<td><%=ap.getAppoinDate()%></td>
							<td><%=ap.getEmail()%></td>
							<td><%=ap.getPhNo()%></td>
							<td><%=ap.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=ap.getAddress()%></td>
							<td><%=ap.getStatus()%></td>

						</tr>

						<%
						}
						%>


					</tbody>

				</table>

			</div>



		</div>



	</div>





</body>
</html>