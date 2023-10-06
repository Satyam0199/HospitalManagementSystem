package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Connection_Database;
import com.dao.UserDao;
@WebServlet("/userchangePassword")
public class changePassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid=Integer.parseInt(req.getParameter("uid"));
		String oldPasword=req.getParameter("oldPassword");
		String newPassword=req.getParameter("newPassword");
		
		UserDao dao= new UserDao(Connection_Database.getConn());
		HttpSession session= req.getSession();
		
		if(dao.checkOldPassword(uid,oldPasword))
		{
			if(dao.changePassword(uid, newPassword))
			{
				session.setAttribute("sucMsg", "Password Change Successfully");
				resp.sendRedirect("change_password.jsp");
			}
			else
			{
				session.setAttribute("errorMsg", "Something wrong On server");
				resp.sendRedirect("change_password.jsp");
			}
		}
	
	else
	{
		session.setAttribute("errorMsg", "Old Password Incorrect");
		resp.sendRedirect("change_password.jsp");
	}
		
	}

}
