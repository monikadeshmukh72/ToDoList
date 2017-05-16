

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Searchtodo
 */
@WebServlet("/Searchtodo")
public class Searchtodo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Searchtodo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String mid=request.getParameter("mid");
		Statement s = null;
		
		Connection cn=JDBCConnection.getConnection();
		try {
			s = (Statement) cn.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		int flag=0;

		ResultSet rs = null;
		try {
			rs = (ResultSet) s.executeQuery("select * from todo where text = '" + mid + "'" );
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter(); 
		out.println("<table style=\"width: 90%\" border=\"1\">");
		out.println("<tr>");
		out.println("<td>TEXT</td>");

		out.println("<td>Creation Date</td>");
		out.println("<td>Due Date</td>");
		out.println("<td>Status</td>");

		out.println("</tr>");
		out.println("</table>");
		try {
			while(rs.next())
			{

				String a1=rs.getString(1);

				String a2 = rs.getString(3);				
				String a3 = rs.getString(2);
				String a4 = rs.getString(4);

				response.setContentType("text/html");
				PrintWriter out1 = response.getWriter(); 
				out1.println("<table style=\"width: 90%\" border=\"1\">");
				out1.println("<tr>");
				out1.println("<td>"+a1+"</td>");

				out1.println("<td>"+a2+"</td>");
				out1.println("<td>"+a3+"</td>");
				out1.println("<td>"+a4+"</td>");

				out1.println("</tr>");
				out1.println("</table>");






				try {
					if (rs.isLast())
						break;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
