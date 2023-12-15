package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.CreateConnnection;

//import oracle.jdbc.OracleTypes;

@WebServlet("/logincheck")
public class logincheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
   
   
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PreparedStatement pst;
//		PreparedStatement pst1;
//		CallableStatement cstm;
	   
			
			String userId=request.getParameter("userid");
			String password=request.getParameter("password");
			System.out.println(userId);
			Connection con=CreateConnnection.createcon();
	
			try {
				
				pst=con.prepareStatement("select password from users where userid=?");
				pst.setString(1, userId);
				
				ResultSet rs=(ResultSet)pst.executeQuery();
				boolean isValidUser=false;
				while(rs.next()){
					if(password.equals(rs.getString(1)))
					{
						
							HttpSession hp=request.getSession();
							hp.setAttribute("userId",userId);
							hp.setMaxInactiveInterval(0);
							response.sendRedirect("home.jsp");
						
							isValidUser=true;
							break;
						
					}
				}
				
				
				if(!isValidUser){
					HttpSession hp=request.getSession();
					
					hp.setAttribute("error","Invalid UserID/Password");
					hp.setMaxInactiveInterval(1);
					//pw.println("Invalid UserID/Password");
					response.sendRedirect("login.jsp");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
