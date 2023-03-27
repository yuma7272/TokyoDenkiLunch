package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentDAO {
	//studentデータベースから探す
	public Student findByStudent (String userName , String password) {
	
	DBConnection dbConnection = new DBConnection();
	Student student = new Student();
	String sql = "SELECT * FROM student WHERE userName = ? AND password = ?;";
		
	try {
		PreparedStatement pstmt = dbConnection.getConnect().prepareStatement(sql);
		
		pstmt.setString(1 , userName); //1つ目の?にuserNameを挿入
		pstmt.setString(2 , password); //2つ目の?にpasswordを挿入
		
		ResultSet resultSet = pstmt.executeQuery();
			
		//もしデータベースに情報があったら
		if (resultSet.next()) {
			    student.setStudentID(resultSet.getInt("studentid"));
				student.setUserName(resultSet.getString("username"));
				student.setGrade(Integer.parseInt(resultSet.getString("grade")));
				student.setSubject(resultSet.getString("subject"));
				student.setGroupID(resultSet.getInt("groupid"));
		}
			
		resultSet.close();
		dbConnection.closeConnect();
		
		//データベースに情報があり,studentオブジェクトに情報が入っていれば
		if(student.getUserName() != null) {
			return student;
		}
		else {
			return null;
		}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//ログイン後、studentの情報を更新するのに使用
	public Student findByStudentName(String userName) {
		DBConnection dbConnection = new DBConnection();
		Student student = new Student();
		String sql = "SELECT * FROM student WHERE userName = ? ;";
		
		try {
			PreparedStatement pstmt = dbConnection.getConnect().prepareStatement(sql);
			
			pstmt.setString(1 , userName); //1つ目の?にuserNameを挿入
			
			ResultSet resultSet = pstmt.executeQuery();
			
			//もしデータベースに情報があったら
			if (resultSet.next()) {
				    student.setStudentID(resultSet.getInt("studentid"));
					student.setUserName(resultSet.getString("username"));
					student.setGrade(Integer.parseInt(resultSet.getString("grade")));
					student.setSubject(resultSet.getString("subject"));
					student.setGroupID(resultSet.getInt("groupid"));
			}
			
			resultSet.close();
			dbConnection.closeConnect();
			
			//データベースに情報があり,studentオブジェクトに情報が入っていれば
			if(student.getUserName() != null) {
				return student;
			}
			else {
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean updateGroupID(String userName , int groupID) {
		DBConnection dbConnection = new DBConnection();
		String sql = "UPDATE student SET groupid = ? WHERE username = ? ;";
		
		try {
			PreparedStatement pstmt = dbConnection.getConnect().prepareStatement(sql);
			
			pstmt.setInt(1 , groupID); //1つ目の?にgroupIDを挿入
			pstmt.setString(2 , userName); //2つ目の?にuserNameを挿入
			
			pstmt.executeUpdate();
			pstmt.close();
			dbConnection.closeConnect();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	//グループ脱退
	public boolean resetGroupID(String userName) {
		DBConnection dbConnection = new DBConnection();
		String sql = "UPDATE student SET groupid = 0 , plan = '未定' WHERE username = ? ;";
		
		try {
			PreparedStatement pstmt = dbConnection.getConnect().prepareStatement(sql);
			
			pstmt.setString(1 , userName); //1つ目の?にuserNameを挿入
		
			pstmt.executeUpdate();
			pstmt.close();
			dbConnection.closeConnect();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	

	public boolean  updatePlan(String userName , String plan) {
		DBConnection dbConnection = new DBConnection();
		String sql = "UPDATE student SET plan = ? WHERE username = ? ;";
		
		try {
			PreparedStatement pstmt = dbConnection.getConnect().prepareStatement(sql);
			
			pstmt.setString(1 , plan); //1つ目の?にplanを挿入
			pstmt.setString(2 , userName); //1つ目の?にuserNameを挿入
		
			pstmt.executeUpdate();
			pstmt.close();
			dbConnection.closeConnect();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	public ArrayList<Student> getStudentByGroupID(int groupID){
		DBConnection dbConnection = new DBConnection();
		ArrayList<Student> studentList = new ArrayList<>();
		String sql = "SELECT * FROM student WHERE groupid = ?;";
		
		try {
			PreparedStatement pstmt = dbConnection.getConnect().prepareStatement(sql);
			
			pstmt.setInt(1 , groupID); //1つ目の?にgroupIDを挿入
			
			ResultSet resultSet = pstmt.executeQuery();
			
			//もしデータベースに情報があったら
			while(resultSet.next()) {
				Student student = new Student();
				student.setStudentID(resultSet.getInt("studentid"));
				student.setUserName(resultSet.getString("username"));
				student.setGrade(Integer.parseInt(resultSet.getString("grade")));
				student.setSubject(resultSet.getString("subject"));
				student.setGroupID(resultSet.getInt("groupid"));
				String plan = resultSet.getString("plan");
				
				student.setPlan(plan);
					
				studentList.add(student);	
			}
			
			resultSet.close();
			dbConnection.closeConnect();
			
			return studentList;
			
		} catch (Exception e) {
			e.printStackTrace();
			return studentList;
		}
	}
	
	public boolean register(String userName , int grade , String subject , String password) {
		DBConnection dbConnection = new DBConnection();
		String sql = "INSERT INTO student(username, grade, subject , password) values (?, ?, ?, ?);";
		
		try {
			PreparedStatement pstmt = dbConnection.getConnect().prepareStatement(sql);
			
			pstmt.setString(1 , userName); //1つ目の?にuserNameを挿入
			pstmt.setInt(2 , grade); //2つ目の?にgradeを挿入
			pstmt.setString(3 , subject ); //3つ目の?にsubjectを挿入
			pstmt.setString(4 , password); //4つ目の?にpasswordを挿入
			
			pstmt.executeUpdate();
			pstmt.close();
			dbConnection.closeConnect();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
		
}