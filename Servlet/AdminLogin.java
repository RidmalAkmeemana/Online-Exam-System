package com.examination;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String uname = request.getParameter("uname");
			String pass = request.getParameter("upass");
			String vercode = request.getParameter("vercode");
			String captchaDB = null;
			HttpSession hs = request.getSession();
			String tokens = UUID.randomUUID().toString();
			Random random = new Random();
			int newRandomCaptcha = random.nextInt(9000) + 10000;
			Connection con = DatabaseConnection.getConnection();
			Statement st = con.createStatement();
			ResultSet captchResultSet = DatabaseConnection.getResultFromSqlQuery("select * from tblcaptcha");
			if (captchResultSet.next()) {
				captchaDB = captchResultSet.getString(1);
			}
			if (captchaDB.equals(vercode)) {
				ResultSet resultset = st.executeQuery("select * from tbladmin where uname='" + uname + "' AND upass='" + pass + "'");
				if (resultset.next()) {
					hs.setAttribute("uname", uname);
					response.sendRedirect("addStudent.jsp?_tokens='" + tokens + "'");
				} else {
					int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='"+ newRandomCaptcha + "'");
					response.sendRedirect("adminLogin.jsp");
				}
			} else {
				response.sendRedirect("invalidAdminCaptcha.jsp");
			}
			int update = DatabaseConnection.insertUpdateFromSqlQuery("update tblcaptcha set captcha='"+ newRandomCaptcha + "'");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
