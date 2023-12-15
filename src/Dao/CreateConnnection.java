package Dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;


import java.sql.*;

public class CreateConnnection {
	private static final long serialVersionUID = 1L;
	
	static Connection connection;

	public static Connection createcon() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_ticket", "root", "root");
		} catch (ClassNotFoundException | SQLException exception) {
			exception.printStackTrace();
		}
		
		return connection;
	}
}

