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
<title>Patient Page</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<%@ include file="../component/css.jsp"%>
<%@ include file="navbar.jsp"%>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>

	</c:if>

	<div class="container p-3">
	<br><br>
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class=" fs-3 text-center">
							<b>Appointment List</b>
						</p><br>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty sucMsg}">
							<p class="text-center text-success fs-5">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>

									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Dob</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No.</th>
									<th scope="col">Diseases</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
									

								</tr>

							</thead>
							<tbody>
								<%
								
								Doctor d=(Doctor)session.getAttribute("doctObj");
								AppointmentDao dao= new AppointmentDao(Connection_Database.getConn());
								List<Appointment> list= dao.getAllAppointmentByDoctorLogin(d.getId());
								for(Appointment ap: list)
								{%>
									<tr>
									<th><%=ap.getFullName() %></th>
									<td><%=ap.getGender() %></td>
									<td><%=ap.getDob() %></td>
									<td><%=ap.getAppoinDate() %></td>
									<td><%=ap.getEmail()%></td>
									<td><%=ap.getPhNo() %></td>
									<td><%=ap.getDiseases() %></td>
									<td><%=ap.getStatus() %></td>
									<td>
									<%
									if("Pending".equals(ap.getStatus()))
									{%>
									<a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm">Comment</a>
										
									<% }
									else
									{%>
										<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
											
								<%	}
											
									%>
									
									</td>
									
									
									</tr>
									
								<%}
								
								%>


							</tbody>

						</table>

					</div>



				</div>



			</div>



		</div>


	</div>


</body>
</html>