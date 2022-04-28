import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.util.*;

public class loginChecker extends HttpServlet{
	public void doGet(HttpServletRequest rqt, HttpServletResponse rsp){
	try{
		String userName = rqt.getParameter("u");
		String password = rqt.getParameter("p");
		String submitType = rqt.getParameter("s");
		Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Games", "hsr", "Harshal@1212");
	    	Statement stmt = con.createStatement();
	    	PrintWriter out = rsp.getWriter();
	    	if(submitType.equals("login")){
	    		ResultSet rs = stmt.executeQuery("select * from users;");
	    		out.println("came here");
	    		while(rs.next()){
	    			String us = rs.getString(1);
	    			String pass = rs.getString(2);
	    			out.println(us+" "+pass+"<br>");
	    			if(us.equals(userName) && password.equals(pass)){
	    				rsp.sendRedirect("home.html");
				}
	    		}
	    			RequestDispatcher dispatcher = rqt.getRequestDispatcher("tell-me-username-and-password");
				dispatcher.forward(rqt, rsp);
	    	}else{
	    		String query = "insert into users value (?, ?)";
	    		PreparedStatement ps = con.prepareStatement(query);
	    		ps.setString(1, userName);
	    		ps.setString(2, password);
	    		int i = ps.executeUpdate();
	    		rsp.sendRedirect("home.html");
			return;
	    	}
	}catch(Exception e){
		e.printStackTrace();
	}
	}
}
