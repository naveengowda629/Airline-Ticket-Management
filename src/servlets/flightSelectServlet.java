package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/flightSelectServlet")
public class flightSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public flightSelectServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String flightId=request.getParameter("fid");
		System.out.println(flightId);
		HttpSession session=request.getSession();
		session.setAttribute("selectedFid", flightId);
		response.sendRedirect("seats.jsp");
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
