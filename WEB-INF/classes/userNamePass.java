import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

public class userNamePass extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse rsp)
            throws IOException, ServletException {
		PrintWriter out = rsp.getWriter();
		out.println("<HTML>");
		out.println("<HEAD>");
		out.println("<TITLE>User name and password</TITLE>");
		out.println("</HEAD>");
		out.println("<BODY>");
		out.println("incorrect login credential, try again or register");
		out.println("</BODY>");
		out.println("</HTML>");
    }
}
