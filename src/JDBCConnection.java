

	//Step 1: Use interfaces from java.sql package 
	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;
	 
	public class JDBCConnection {
	    //static reference to itself
	    private static JDBCConnection instance = new JDBCConnection();
	    public static final String URL = "jdbc:mysql://localhost/todolist";
	    public static final String USER = "root";
	    public static final String PASSWORD = "monika123";
	    public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver"; 
	     
	    //private constructor
	    private JDBCConnection() {
	        try {
	            //Step 2: Load MySQL Java driver
	            Class.forName(DRIVER_CLASS);
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	    }
	     
	    private Connection createConnection() {
	 
	        Connection connection = null;
	        try {
	            //Step 3: Establish Java MySQL connection
	            connection = DriverManager.getConnection(URL, USER, PASSWORD);
	        } catch (SQLException e) {
	            System.out.println("ERROR: Unable to Connect to Database.");
	        }
	        System.out.println("database connected");
	        return connection;
	    }   
	     
	    public static Connection getConnection() {
	        return instance.createConnection();
	    }
	    
	  
	}

