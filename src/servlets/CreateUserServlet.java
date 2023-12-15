package servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.Users;
import Dao.Functionality;

@WebServlet("/CreateUserServlet")
public class CreateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String userid=request.getParameter("userid");
		String password=request.getParameter("password");
		Functionality functionality=new Functionality();
		Users users =new Users();
		users.setUserid(userid);
		users.setName(name);
		users.setPassword(password);
		HttpSession session=request.getSession();
		int result;
		try {
			result = functionality.CreateUser( users);
			if(result==0){
				session.setAttribute("error","Email ID already exists!");
				response.sendRedirect("login.jsp");
			}
			else
				response.sendRedirect("regsuccess.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
