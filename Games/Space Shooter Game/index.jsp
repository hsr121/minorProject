<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Space Shooter</title>
  </head>
  <style>
    body {
      width: 100%;
      overflow: hidden;
      background: url("space.jpg");
      background-size: cover;
    }
    #board {
      position: relative;
      width: 500px;
      height: 500px;
      margin: 40px auto;
      border: 2px solid white;
      background-color: black;
      overflow: hidden;
    }

    #jet {
      position: absolute;
      width: 40px;
      height: 40px;
      background: url("rocket.png");
      background-size: contain;
      background-repeat: no-repeat;
      left: 50%;
      bottom: 0px;
    }

    .bullets {
      position: absolute;
      bottom: 40px;
      left: 51%;
      width: 20px;
      height: 20px;
      background: url("bullet.png");
      background-size: contain;
      background-repeat: no-repeat;
    }

    .rocks {
      position: absolute;
      top: 0px;
      width: 50px;
      height: 50px;
      background: url("alien.png");
      background-size: contain;
      background-repeat: no-repeat;
    }
    #points {
      position: absolute;
      top: 0px;
      margin: 40px;
      opacity: 0.7;
      font-size: 10em;
      color: white;
    }
    #HighScore {
      position: absolute;
      top: 250px;
      margin: 40px;
      opacity: 0.7;
      font-size: 3em;
      color: white;
    }
  </style>
  <script src="app.js" defer></script>
  <body>
    <div id="board">
      <div class="rocks"></div>
      <div id="jet"></div>
    </div>
    <div id="points">0</div>
    <div id = "HighScore">
    HighScore:
    <%
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/Games", "hsr", "Harshal@1212");
    	Statement stmt = con.createStatement();
    	int lastScore = 0;
    	try{
    		lastScore = Integer.parseInt(request.getParameter("score"));
    	}catch(Exception e){
    	}
    	ResultSet rs = stmt.executeQuery("select score from highscores where name=\"space\"");
    	rs.next();
    	int highScore = rs.getInt(1);
    	if(lastScore>highScore){
    		String query = "update highscores set score=? where name=\"space\"";
    		PreparedStatement ps = con.prepareStatement(query);
    		ps.setString(1, ""+lastScore);
    		int i = ps.executeUpdate();
    		out.println(lastScore);
    	}else{
	    	out.println(highScore);
	}
    %>
    </div>
  </body>
</html>
