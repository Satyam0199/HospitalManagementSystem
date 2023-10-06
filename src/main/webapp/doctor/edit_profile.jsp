<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.connection.Connection_Database"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile Page</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="../component/css.jsp"%>
	<%@include file="../component/navbar.jsp"%>

	
	
	<div class="container p-5 ">
		
		<div class="row">

						<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
			<c:if test="${not empty errorMsg }">
						<p class="fs-4 text-center text-danger">${errorMsg }</p>
						<c:remove var=" errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty sucMsg }">
						<p class="fs-4 text-center text-success">${sucMsg }</p>
						<c:remove var=" sucMsg" scope="session" />
					</c:if>
			<div class="card-body">
			<p class="fs-3 text-center">
						<b>Edit Profile</b>
					</p>
			<form action="../doctorUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-lable">Full Name</label><input type="text"
									required name="fullname" class="form-control" value="${doctObj.fullName }">
							</div>

							<div class="mb-3">
								<label class="form-lable">DOB</label><input type="date" required
									name="dob" class="form-control" value="${doctObj.dob}">
							</div>

							<div class="mb-3">
								<label class="form-lable">Qualification</label><input
									type="text" required name="qualification" class="form-control" value="${doctObj.qualification}">
							</div>

							<div class="mb-3">
								<label class="form-lable">Specialist</label><select required
									name="spec" class="form-control">
									<option>${doctObj.specialist}"</option>

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
								<label class="form-lable">Email</label><input type="email" readonly
									required name="email" class="form-control" value="${doctObj.email}">
							</div>

							<div class="mb-3">
								<label class="form-lable">Mob No</label><input type="number"
									required name="mobno" class="form-control"value="${doctObj.mobNo}">
							</div>
							
							<input type="hidden" name="id" value="${doctObj.id }">

							

							<button type="submit" class="btn btn-success col-md-6 offset-md-3">Submit</button>

						</form>
			</div>
			</div>
			

		</div>

	</div>

</body>
</html>