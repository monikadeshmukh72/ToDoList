

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Deletemember
 */
@WebServlet("/Deletemember")
public class Deletemember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletemember() {
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
		Connection cn=JDBCConnection.getConnection();
		 PreparedStatement delete;
		try {
			delete = (PreparedStatement) cn.prepareStatement("delete from todo where text =?");
			delete.setString(1, mid);
			int val=delete.executeUpdate();
			if(val>=1)
			{
				response.setContentType("text/html");
				PrintWriter out = response.getWriter(); 
				  
				 out.println("<script type=\"text/javascript\">");  
				 out.println("alert('Deleted Sucessfully');");  
				 out.println("</script>");
				System.out.println("deleted successfully");
			}
			else
				System.out.println("Error");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("NewFile.html");
        rd.forward(request, response);        
	 
		
		doGet(request, response);
	}

}
