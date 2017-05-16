

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class InsertToDoServlet
 */
@WebServlet("/InsertToDoServlet")
public class InsertToDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertToDoServlet() {
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
		String msz=request.getParameter("to_do_msz");
		String duedate=request.getParameter("duedate");
		String crdate=request.getParameter("creationdate");
		String status=request.getParameter("typeofstud1");
		Connection cn=JDBCConnection.getConnection();
		 PreparedStatement updateemp;
		
		try {
			updateemp = (PreparedStatement) cn.prepareStatement("insert into todo values(?,?,?,?)");
			 updateemp.setString(1,msz);
		      updateemp.setString(2,duedate);
		      updateemp.setString(3, crdate);
		      updateemp.setString(4, status);
		      updateemp.executeUpdate();
		      
		      PrintWriter out = response.getWriter();  
				 response.setContentType("text/html");  
				 out.println("<script type=\"text/javascript\">");  
				 out.println("alert('Added Sucessfully');");  
				 out.println("</script>");

		      
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("NewFile.html");
        rd.forward(request, response);        
	
		
		
		doGet(request, response);
	}

}
