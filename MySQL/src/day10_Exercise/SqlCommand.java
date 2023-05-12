package day10_Exercise;

import java.sql.*;

public class SqlCommand {
		static Connection con = null;
		static Statement st;
		static ResultSet rs;
	
		static {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");								//loading and registering driver
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice", "root", "pass");
				System.out.println("\nConnection established.\n");
				st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs = st.executeQuery("Select * from Student");
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
		
		public void insertData(Student s) throws SQLException {
			
			String query = "insert into Student values(?,?)";
			
			PreparedStatement prepst = con.prepareStatement(query);
			prepst.setInt(1, s.id);
			prepst.setString(2, s.name);
			prepst.executeUpdate();
			
			System.out.println("\nRow inserted.");
		
		}
		
		public void showAll() throws SQLException {
			
			rs.beforeFirst();
			while(rs.next()) {
				System.out.println(rs.getInt(1) + "\t" + rs.getString(2));
			}
		}
		
		public void updateData(int row, int column, String new_value) throws SQLException {
			rs.absolute(row);
			rs.updateString(column, new_value);
			rs.updateRow();
			System.out.println("\nRow updated!");
		}
		
		public void updateData(int row, int column, int new_value) throws SQLException {
			rs.absolute(row);
			rs.updateInt(column, new_value);
			rs.updateRow();
			System.out.println("\nRow updated!");
		}
		
		public void deleteRow(int row) throws SQLException {
			rs.absolute(row);
			System.out.println("\nThe following record has been deleted!\n" + rs.getInt(1) + "\t" + rs.getString(2));
			rs.deleteRow();
		}
		
}