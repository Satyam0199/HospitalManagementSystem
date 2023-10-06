<%@page import="com.dao.SpecialistDao"  %>
<%@page import="com.dao.DoctorDao"  %>
<%@page import="com.connection.Connection_Database"  %>
<%@page import="java.util.*"  %>
<%@page import="com.entity.Specalist"  %>
<%@page import="com.entity.Doctor"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
<body>
	<%@include file="../component/navbar.jsp"%>
	<%@include file="../component/css.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-denger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty sucMsg}">
							<div class="text-center text-success fs-5" role="alert">${sucMsg}</div>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label><input type="text"
									required name="fullname" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-lable">DOB</label><input type="date" required
									name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-lable">Qualification</label><input
									type="text" required name="qualification" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-lable">Specialist</label><select required
									name="spec" class="form-control">
									<option>--select--</option>

									 <%
									SpecialistDao dao = new SpecialistDao(Connection_Database.getConn());
									List<Specalist> list = dao.getAllSpecialist();
									for (Specalist s : list) {
									%>
									<option><%=s.getSpecialistName()%></option>
									<%
									}
									%> 
								</select>
							</div>

							<div class="mb-3">
								<label class="form-lable">Email</label><input type="email"
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-lable">Mob No</label><input type="number"
									required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-lable">Password</label><input type="password"
									required name="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>

						</form>

					</div>

				</div>

			</div>

			<div class="col-md-8">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob No</th>
									<th scope="col">Action</th>

								</tr>
							</thead>
							<tbody>

								<%
								DoctorDao dao2 = new DoctorDao(Connection_Database.getConn());
								List<Doctor> list2 = dao2.getAllDoctor();
								for (Doctor d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary mr-2">Edit</a>
										<a href="../deleteDoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-danger mr-2">Delete</a></td>

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
