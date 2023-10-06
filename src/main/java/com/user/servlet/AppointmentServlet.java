package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Connection_Database;
import com.dao.AppointmentDao;
import com.entity.Appointment;
import java.lang.*;


@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int userId =Integer.parseInt(req.getParameter("userid").trim());
		String fullname = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String dob = req.getParameter("dob");
		String appoint_date = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctorId= Integer.parseInt(req.getParameter("doct").trim());
		String address = req.getParameter("address");

		Appointment ap = new Appointment(userId, fullname, gender, dob, appoint_date, email, phno, diseases,
				doctorId, address, "Pending");
		
		AppointmentDao dao= new AppointmentDao(Connection_Database.getConn());
		HttpSession session = req.getSession();
		if(dao.addAppointment(ap))
		{
			session.setAttribute("sucMsg","Appointment Successfully");
			resp.sendRedirect("user_appointment.jsp");
		}
		else
		{
			session.setAttribute("errorMsg", "Something wrong on Server");
			resp.sendRedirect("user_appointment.jsp");
			
		}

	}

}
