package com.jeju.trip.api;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBC {
	public static Connection getConnection(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 성공");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			System.out.println("커넥션 성공");
			return DriverManager.getConnection(url, "final", "1234");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}	// getConnection() END
	
	
	
	public JDBC() {
		
	}
	
	public static void close(PreparedStatement stmt, Connection conn){
		if(stmt != null){
			try{
				if(!stmt.isClosed()){
					stmt.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		
		if(conn != null){
			try{
				if(!conn.isClosed()){
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}
		
	}	// close(PreparedStatement stmt, Connection conn) END
	
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn){
		if(rs != null){
			try{
				if(!rs.isClosed()){
					stmt.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				rs=null;
			}
		}
		
		if(stmt != null){
			try{
				if(!stmt.isClosed()){
					stmt.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				stmt=null;
			}
		}
		
		if(conn != null){
			try{
				if(!conn.isClosed()){
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				conn=null;
			}
		}
		
	}	// close(ResultSet rs, PreparedStatement stmt, Connection conn) END


}
