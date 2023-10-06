<%@page import="com.connection.Connection_Database" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="component/css.jsp" %>
<%@include file="component/navbar.jsp" %>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>

<% Connection conn=Connection_Database.getConn(); 

%>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">

			<div class="carousel-item active">
				<img src="img/doc1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/surgery.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>

		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<br>
	<hr>

	<div class="container p-3">
		<p class="text-center fs-2">Key Features of our Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>There is no shortage of safety slogans to be found in
									workplaces around the world. Some these sayings and slogans are
									great, others not so much. We have all seen the posters with
									cheesy safety messages posted in a workplace, and we even put
									some on our list in case someone wants to use them. you will
									find on similar lists found across the web in an effort to not
									waste your time.</p>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>Hospitals are representative of complex environment in
									which different aspects including patients, staff, equipment,
									services, and information are interfaced. Maintaining a safe
									environment reflects a level of competent healthcare that must
									be fulfilled for patient safety. In this context, the clinical
									engineer plays an important role in providing safe environment
									within hospital.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctors</p>
								<p>Good doctors are persistent in advocating for their
									patients. Good doctors do whatever it takes to help meet their
									patients' needs. Whether that means helping them navigate the
									health care system by finding specialists or acquiring the
									prescriptions they need, they should be willing to provide that
									support. Making a bid for friendship with your health care
									provider is somewhat risky.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Medical research (or biomedical research), also known as
									experimental medicine, encompasses a wide array of research,
									extending from "basic research" (also called bench science or
									bench research),involving fundamental scientific principles
									that may apply to a preclinical understanding to clinical
									research, which involves studies of people who may be subjects
									in clinical trials.</p>
							</div>
						</div>
					</div>
	
					
				</div>
			</div>
			<div class="col-md-4">
				<img alt="" src="img/d.png" height="300px" width="500">
	
				
			</div>
		</div>
	</div>
	<hr>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>

		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/1.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Samuani Simi</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/2.jpg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Ashok Jain</p>
						<p class="fs-7">(Chief & Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/3.png" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Parul Jain</p>
						<p class="fs-7">(Chief & Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img alt="" src="img/5.jpeg" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Abhisehk Jain</p>
						<p class="fs-7">(Chief & Doctor)</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<%@include file="component/footer.jsp" %>
	
	
</body>
</html>