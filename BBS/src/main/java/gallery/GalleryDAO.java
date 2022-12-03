package gallery;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class GalleryDAO{
	private Connection conn;
	private ResultSet rs;
	
	public GalleryDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "00000000";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getNext() {
		String SQL = "SELECT ID FROM GALLERY ORDER BY ID DESC";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return rs.getInt(1)+1;
			 }
			 return 1; // 첫번째인 경우
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Gallery> getList(){
		String SQL = "SELECT * FROM GALLERY WHERE ID < ? ORDER BY ID DESC LIMIT 10";
		ArrayList<Gallery> list = new ArrayList<Gallery>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Gallery gall = new Gallery();
				gall.setID(rs.getInt(1));
				gall.setTitle(rs.getString(2));
				gall.setTestLink(rs.getString(3));
				gall.setImgLink(rs.getString(4));
				list.add(gall);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list; // 데이터베이스 오류
	}
	
	public boolean nextPage() {
		String SQL = "SELECT * FROM GALLERY WHERE ID < ?";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, getNext());
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 return true;
			 }
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류
	}
	
	public Gallery getGallery(int ID) {
		String SQL = "SELECT * FROM GALLERY WHERE ID = ?";
		try {
			 PreparedStatement pstmt = conn.prepareStatement(SQL);
			 pstmt.setInt(1, ID);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				Gallery gall = new Gallery();
				gall.setID(rs.getInt(1));
				gall.setTitle(rs.getString(2));
				gall.setImgLink(rs.getString(3));
				gall.setTestLink(rs.getString(4));
				return gall;
			 }
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null; //데이터베이스 오류
	}
}