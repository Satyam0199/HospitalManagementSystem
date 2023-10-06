<%@page import="java.util.List"%>
<%@page import="com.connection.Connection_Database"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/css.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

	<div class="container p-5">
		<div class="row">

			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">
						<b>User Appointment</b>
					</p>
					<c:if test="${not empty errorMsg }">
						<p class="fs-4 text-center text-danger">${errorMsg }</p>
						<c:remove var=" errorMsg" scope="session" />
					</c:if>
					<c:if test="${not empty sucMsg }">
						<p class="fs-4 text-center text-success">${sucMsg }</p>
						<c:remove var=" sucMsg" scope="session" />
					</c:if>

					<form class="row g-3" action="addAppointment" method="post">
						<input type="hidden" name="userid" value="${userObj.id }">

						<div class="col-md-6">
							<label for="inputEmail4" class="form-lable">Full Name</label><input
								required type="text" class="form-control" name="fullname">
						</div>

						<div class="col-md-6">
							<label>Gender</label><select class="form-control" name="gender"
								required>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>

						<div class="col-md-6">
							<label for="inputEmail4" class="form-lable">Appointment
								Date</label><input required type="date" class="form-control"
								name="appoint_date">
						</div>

						<div class="col-md-6">
							<label for="inputEmail4" class="form-lable">Date of Birth</label><input
								required type="date" class="form-control" name="dob">
						</div>


						<div class="col-md-6">
							<label for="inputEmail4" class="form-lable">Email</label><input
								required type="email" class="form-control" name="email">
						</div>

						<div class="col-md-6">
							<label for="inputEmail4" class="form-lable">Phone No</label><input
								required type="number" maxlength="10" class="form-control"
								name="phno">
						</div>

						<div class="col-md-6">
							<label for="inputEmail4" class="form-lable">Diseases</label><input
								required type="text" class="form-control" name="diseases">
						</div>

						<div class="col-md-6">
							<label for="inputPassword4" class="form-lable">Doctor</label> <select
								class="form-control" name="doct" required>
								<option value="">--select--</option>

								<%
								DoctorDao dao = new DoctorDao(Connection_Database.getConn());
								List<Doctor> list = dao.getAllDoctor();
								for (Doctor d : list) {
								%>
								<option value="<%=d.getId()%> "><%=d.getFullName()%> (<%=d.getSpecialist()%>)
								</option>
								<%
								}
								%>



							</select>
						</div>

						<div class="col-md-12">
							<lable>Full Address</lable>
							<textarea rows="3" required name="address" class="form-control"
								cols=""></textarea>
						</div>


						<c:if test="${empty userObj }">
							<a href="user_login.jsp"
								class="col-md-6 offset-md-3 btn btn-success">Submit</a>
						</c:if>

						<c:if test="${ not empty userObj }">
							<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
						</c:if>
					</form>
				</div>
			</div>
		</div>

	</div>
	<%@include file="component/footer.jsp"%>
</body>
</html>