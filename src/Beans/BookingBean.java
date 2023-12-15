package Beans;

public class BookingBean {
	private int tripId;
	private String flightName;
	private String from1;
	private String to1;
	private String date;
	private String departure;
	private String pname;
	
	

	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public int getTripId() {
		return tripId;
	}
	public void setTripId(int tripId) {
		this.tripId = tripId;
	}
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	
	
	public String getFrom1() {
		return from1;
	}
	public void setFrom1(String from1) {
		this.from1 = from1;
	}
	public String getTo1() {
		return to1;
	}
	public void setTo1(String to1) {
		this.to1 = to1;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}

	

}
