package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Beans.FlightsBean;
import Dao.Functionality;


@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public bookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String pname=request.getParameter("pname");
			int nofseats=Integer.parseInt(request.getParameter("nofseats"));
			String seats=request.getParameter("seats");
			
			HttpSession session=request.getSession();
			String fid=(String) session.getAttribute("selectedFid");
			String date=(String) session.getAttribute("date");
			String userid=(String) session.getAttribute("userId");
			
			Functionality functionality=new Functionality();
			FlightsBean bean=functionality.getSingleFlight(fid);
			
			int tripId=functionality.insertbooking(fid,bean.getName(),bean.getSource(),bean.getDest(), date, userid, pname, nofseats, seats,bean.getPrice());
			session.setAttribute("tripId", tripId);
			response.sendRedirect("success.jsp");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
