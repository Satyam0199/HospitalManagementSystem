 <%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.*"%>
<%@page import="com.connection.Connection_Database"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="java.util.*"%> 
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

			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-denger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<c:if test="${not empty sucMsg}">
							<div class="text-center text-success fs-5" role="alert">${sucMsg}</div>
							<c:remove var="sucMsg" scope="session" />
						</c:if>
						
 						<%
						int id=Integer.parseInt(request.getParameter("id"));
						DoctorDao dao2=new DoctorDao(Connection_Database.getConn());
						Doctor d=dao2.getDoctorById(id);
						%>

						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label><input type="text"
									required name="fullname" class="form-control" value=" <%=d.getFullName()%> ">
							</div>

							<div class="mb-3">
								<label class="form-lable">DOB</label><input type="date" required
									name="dob" class="form-control" value="<%=d.getDob()%>">
							</div>

							<div class="mb-3">
								<label class="form-lable">Qualification</label><input
									type="text" required name="qualification" class="form-control" value="<%=d.getQualification()%> ">
							</div>

							<div class="mb-3">
								<label class="form-lable">Specialist</label><select required
									name="spec" class="form-control">
									 <option><%=d.getSpecialist() %></option>

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
									required name="email" class="form-control" value="<%=d.getEmail()%>">
							</div>

							<div class="mb-3">
								<label class="form-lable">Mob No</label><input type="number"
									required name="mobno" class="form-control" value="<%=d.getMobNo()%>">
							</div>

							<div class="mb-3">
								<label class="form-lable">Password</label><input type="password"
									required name="password" class="form-control" value="<%=d.getPassword()%>">
							</div>
							
							<input type="hidden" name="id" value="<%=d.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12">Update</button>

						</form>

					</div>

				</div>

			</div>

			

		</div>
	</div>

</body>
</html>
