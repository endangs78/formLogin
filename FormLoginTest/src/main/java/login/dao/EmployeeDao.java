package login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.sendgrid.Content;
import com.sendgrid.Email;
import com.sendgrid.Mail;
import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;

import login.bean.Employee;

public class EmployeeDao {
	
	public int registerEmployee(Employee employee) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "INSERT INTO login" 
	            + "  (name, phone, password, email, created_on, last_login) VALUES "
				+ " ( ?, ?, ?, ?,current_date,current_date);";

		int result = 0;

		Class.forName("org.postgresql.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:postgresql://localhost:5432/loginform","postgres","postgres");

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, employee.getName());
			preparedStatement.setInt(2, employee.getPhone());
			preparedStatement.setString(3, employee.getPassword());
			preparedStatement.setString(4, employee.getEmail());
			
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			result = preparedStatement.executeUpdate();
			
			sendEmail(employee.getEmail());
			
		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return result;
	}
	
	private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
	
	public static void sendEmail(String toEmail){
		try
	    {
			   Email from = new Email("noreply@gmail.com");
		       Email to = new Email(toEmail); // use your own email address here
		       String subject = " Test Sending with SendGrid";
		      
		       String message = " this is email testing";
		       
		       Content content = 
		    		   new Content("text/html", message);

		       Mail mail = new Mail(from, subject, to, content);

		       SendGrid sg = new SendGrid("************************************");
		       Request request = new Request();

		       request.setMethod(Method.POST);
		       request.setEndpoint("mail/send");
		       request.setBody(mail.build());

		       Response response = sg.api(request);

		       System.out.println(response.getStatusCode());
		       System.out.println(response.getHeaders());
		       System.out.println(response.getBody());
		   
	    }
	    catch (Exception e) {
	      e.printStackTrace();
	    }
	}
}
