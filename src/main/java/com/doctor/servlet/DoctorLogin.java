package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Connection_Database;
import com.dao.DoctorDao;
import com.dao.UserDao;
import com.entity.Doctor;
import com.entity.User;
@WebServlet("/doctorLogin")

public class DoctorLogin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		DoctorDao dao = new DoctorDao(Connection_Database.getConn());

		Doctor doctor = dao.login(email, password);

		if (doctor != null) {
			session.setAttribute("doctObj", doctor);
			resp.sendRedirect("doctor/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Invaild Email & Password");
			resp.sendRedirect("doctor_login.jsp");
		}
		
		
	}

}
