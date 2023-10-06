<%@page import="com.dao.AppointmentDao"%>

<%@page import="com.dao.DoctorDao"%>
<%@page import="com.connection.Connection_Database"%>
<%@page import="java.util.*"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Appointment</title>


</head>
<body>
	<%@include file="component/css.jsp"%>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card  card-paint">
					<div class="card-body">
						<p class=" fs-4 fw-bold text-center"><b>Appointment
							List</b></p>
						<table class="table">
							<thead>
								<tr>
									
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Date of birth</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>

								</tr>

							</thead>
							<tbody>
							<% 
							User user=(User)session.getAttribute("userObj");
							AppointmentDao dao = new AppointmentDao(Connection_Database.getConn());
							DoctorDao dao2= new DoctorDao(Connection_Database.getConn());
							List<Appointment> list=dao.getAllAppointmentByLoginUser(user.getId());
							for(Appointment ap :list)
							{
								Doctor d=dao2.getDoctorById(ap.getDoctorId());
							
							%>
							
							<tr>
							<th><%=ap.getFullName() %></th>
							<td><%=ap.getGender() %></td>
							<td><%=ap.getDob() %></td>
							<td><%=ap.getAppoinDate() %></td>
							<td><%=ap.getDiseases() %></td>
							<td><%=d.getFullName()%></td>
							<td>
							<% if("Pending".equals(ap.getStatus()))
							{%>
							
							<a href="#" class="btn btn-sm btn-warning">Pending</a>
								
							<% }else{%>
								<%=ap.getStatus() %>
								<%}
							%>
							</td>
							
							</tr>	
							<% 
							}
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