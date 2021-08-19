package com.jeju.trip.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;

import com.jeju.trip.vo.MemberVO;
import com.jeju.trip.vo.TripVO;





public class ApiDAO {
	private PasswordEncoder pwencoder;
	
	public int insertTour(List<TripVO> lt){
		Connection conn =null;
		PreparedStatement pstmt= null;
		TripVO vo = new TripVO();
		
		int res=0;
		String sql="insert into trip (tseq,contentid, title, address1, address2, content, image1, image2, image3, mapx, mapy, zipcode, tel, contenttypeid) values (t_seq.nextval, ?, ?, ?,?,?,?,?,?,?,?,?,?,?)";
		conn=JDBC.getConnection();
	
		
		try{
			
			for(int i = 0; i<lt.size(); i++){
				 vo =lt.get(i);
			pstmt=conn.prepareStatement(sql);
			pstmt.setLong(1, vo.getContentid());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getAddress1());
			pstmt.setString(4, vo.getAddress2());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getImage1());
			pstmt.setString(7, vo.getImage2());
			pstmt.setString(8, vo.getImage3());
			pstmt.setDouble(9, vo.getMapx());
			pstmt.setDouble(10, vo.getMapy());
			pstmt.setString(11, vo.getZipcode());
			pstmt.setString(12, vo.getTel());
			pstmt.setLong(13, vo.getContenttypeid());
			
			
			System.out.println("query ready" + res);
			res=pstmt.executeUpdate();
			System.out.println("result" + res);
			if (res > 0) {
				
				System.out.println("인서트 성공");
				
			}
			
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			JDBC.close(pstmt, conn);
		}
		
		return res;
	}
	
	
	
	
}
