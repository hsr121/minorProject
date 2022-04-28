<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Biker Game</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="container">
        <div id="biker">
            <img src="assets/biker.png" alt="biker">
        </div>
        <div id="block">
            <img src="assets/block.png" alt="blocks">
        </div>
        <div id="road">
            <img src="assets/road.png" alt="road">
        </div>
        <div id="cloud">
            <img src="assets/cloud.jpg" alt="cloud">
        </div>
        <div id="score">Score <b>00</b></div>
        <div id="hscore">High score <b>
        <%
        	Class.forName("com.mysql.jdbc.Driver");
	    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Games", "hsr", "Harshal@1212");
	    	Statement stmt = con.createStatement();
	    	int lastScore = 0;
	    	try{
	    		lastScore = Integer.parseInt(request.getParameter("score"));
	    	}catch(Exception e){
	    	}
	    	ResultSet rs = stmt.executeQuery("select score from highscores where name=\"bike\"");
	    	rs.next();
	    	int highScore = rs.getInt(1);
	    	if(lastScore>highScore){
	    		String query = "update highscores set score=? where name=\"bike\"";
	    		PreparedStatement ps = con.prepareStatement(query);
	    		ps.setString(1, ""+lastScore);
	    		int i = ps.executeUpdate();
	    		out.println(lastScore);
	    	}else{
		    	out.println(highScore);
		}
        %>
        </b></div>
        <div id="gameOver">Game Over</div>
    </div>
    <script src="script.js"></script>
</body>
</html>
