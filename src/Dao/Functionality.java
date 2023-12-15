package Dao;


import java.sql.CallableStatement;
//import com.quinnox.mom.Beans.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.willka.soft.util.BeanUtilityParser;

//import com.quinnox.mom.Beans.emp;
//import com.sun.javafx.fxml.BeanAdapter;

import Beans.BookingBean;
import Beans.FlightsBean;
import Beans.TicketBean;
import Beans.Users;
//import jdk.nashorn.internal.ir.RuntimeNode.Request;

import servlets.bookingServlet;

public class Functionality {
	Connection connection=CreateConnnection.createcon();
	PreparedStatement pst;
	ResultSet rs;
	
	//Register new user
		public int CreateUser(Users users) throws SQLException {
			Connection connection=CreateConnnection.createcon();
			PreparedStatement pst;
				pst=connection.prepareStatement("insert into users(name,userid,password) values(?,?,?)");
				System.out.println("add");
				pst.setString(1, users.getName());
				pst.setString(2, users.getUserid());
				pst.setString(3, users.getPassword());
				System.out.println(pst);
				int result=pst.executeUpdate();
				
			return result;
		}
	
	
	
	//This method returns Name of the current userId
	public static String getUserName(String userId){
		Connection connection=CreateConnnection.createcon();
		PreparedStatement pst=null;
		try {
			pst=connection.prepareStatement("select name from users where userid=?");
			pst.setString(1,userId);
			ResultSet rs=pst.executeQuery();
			String userName="";
			while(rs.next())
				userName=rs.getString(1);
			return userName;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	
	//this method returns the search results of the flights
	public ArrayList<FlightsBean> getFlightResults(String from,String to,String clas){
		System.out.println("get");
		ArrayList<FlightsBean> flightData=new ArrayList<FlightsBean>();
		Connection con=CreateConnnection.createcon();
		PreparedStatement pst;
		try {
			
			pst=con.prepareStatement("select * from flights where source=? and dest=? and clas=?");
			pst.setString(1,from);
			pst.setString(2, to);
			pst.setString(3, clas);
			
			ResultSet rs=pst.executeQuery();
			while(rs.next()){
				FlightsBean fb=new FlightsBean();
				fb.setFid(rs.getString(1));
				fb.setName(rs.getString(2));
				fb.setSource(rs.getString(3));
				fb.setDest(rs.getString(4));
				fb.setPrice(rs.getInt(5));
				fb.setDepart(rs.getString(6));
				fb.setClas(rs.getString(7));
				fb.setDuration(rs.getString(8));
				flightData.add(fb);
				
			}
			
			return flightData;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
		
	//this method confirms the booking by inserting into database
	public int insertbooking(String fid,String flightName,String from,String to,String date,String userid,String pname,int nofseats,String seats,int price) {
		Connection connection=CreateConnnection.createcon();
		PreparedStatement pst;
		PreparedStatement pst2;
		PreparedStatement pst3;
//		int price1=0;
		int tripId=0;
		System.out.println("add");
		
try {
			
//			pst=connection.prepareStatement("select price from flights where fid=?");
//			pst.setString(1,fid);
//			System.out.println(pst);
//			ResultSet rs=pst.executeQuery();
//			while(rs.next()){
//			 price=rs.getInt(1);
//			}
			price=price*nofseats;
			pst2=connection.prepareStatement("insert into booking(flightName,from1,to1,date,fid,userid,nofseats,seats,price,pname) values(?,?,?,?,?,?,?,?,?,?)");
			pst2.setString(1, flightName);
			pst2.setString(2, from);
			pst2.setString(3, to);
			pst2.setString(4,date);
			pst2.setString(5, fid);
			pst2.setString(6,userid);
			pst2.setInt(7,nofseats);
			pst2.setString(8,seats);
			pst2.setInt(9,price);
			pst2.setString(10, pname);
			pst2.executeUpdate();
			
			pst3=connection.prepareStatement("select tripid from booking");
			ResultSet rs2=pst3.executeQuery();
			while(rs2.next()) {
				tripId=rs2.getInt(1);
				System.out.println(tripId);	
			}
			
			return tripId;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
			
		}
		
	}
	public FlightsBean getSingleFlight(String fid)throws Exception{
//		ArrayList< FlightsBean>data=new ArrayList<>();
		FlightsBean bean=new FlightsBean();
		pst=connection.prepareStatement("select * from flights where fid=?");
		pst.setString(1, fid);
		System.out.println(pst);
		rs=pst.executeQuery();
			while(rs.next()) {	
			bean.setFid(rs.getString("fid"));
			bean.setPrice(rs.getInt("price"));
			bean.setName(rs.getString("name"));
			bean.setSource(rs.getString("source"));
			bean.setDest(rs.getString("dest"));
			
//			data.add(bean);
		}return bean;
	}
	//returns ticket object to print the details
	public TicketBean getTicketDetails(int tripId) {
		Connection connection=CreateConnnection.createcon();
		TicketBean bean=new TicketBean();
//		BookingBean bean2=new BookingBean();
		PreparedStatement pst;
		try {
			pst=connection.prepareStatement("select b.tripId, b.date,b.pname,b.seats,b.price,f.name,f.source,f.dest,f.clas,f.depart from flights f,booking b where b.fid=f.fid and b.tripid=?");
			pst.setInt(1,tripId);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
			bean.setTripId(rs.getInt(1));
			bean.setDate(rs.getString(2));
			bean.setPname(rs.getNString(3));
			bean.setSeats(rs.getString(4));
			bean.setPrice(rs.getInt(5));
			bean.setFlightName(rs.getString(6));
			bean.setFrom1(rs.getString(7));
		    bean.setTo1(rs.getString(8));
		    bean.setKlass(rs.getString(9));
		    bean.setDepart(rs.getString(10));
			}
			return bean;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	//this returns a list of all bookings of current user
	public ArrayList<BookingBean> getBookingList(String userId){
		Connection connection=CreateConnnection.createcon();
		ArrayList<BookingBean> list=new ArrayList<BookingBean>();
		PreparedStatement pst;
		try {
			pst=connection.prepareStatement("select b.tripid,f.name,f.source,f.dest,b.date,f.depart from booking b,flights f where b.fid=f.fid and b.userid=?");
			pst.setString(1, userId);
			ResultSet rs=pst.executeQuery();
			
			while(rs.next()) {
			BookingBean bean=new BookingBean();
			bean.setTripId(rs.getInt(1));
			bean.setFlightName(rs.getString(2));
			bean.setFrom1(rs.getString(3));
			bean.setTo1(rs.getString(4));
			bean.setDate(rs.getString(5));
			bean.setDeparture(rs.getString(6));
			list.add(bean);
			System.out.println(list);
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	//this method cancels the ticket i.e deletes the entry from the booking table
	public void cancelTicket(int tripId) {
		Connection connection=CreateConnnection.createcon();
		ArrayList<BookingBean> list=new ArrayList<BookingBean>();
		PreparedStatement pst;
		try {
			pst=connection.prepareStatement("delete from booking where tripid=?");
			pst.setInt(1,tripId);
			pst.executeUpdate();
			
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return;
		}
	}



	
	
	
	
	
	


}