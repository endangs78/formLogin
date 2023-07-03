package login.web;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import login.bean.Employee;
import login.dao.EmployeeDao;

@WebServlet("/register")
public class RegisServlet extends HttpServlet {
 
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private EmployeeDao employeeDao;

    public void init() {
    	employeeDao = new EmployeeDao();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws IOException {
    	
    	try{
    	String a;
        MessageDigest md = MessageDigest.getInstance("MD5");
        a = request.getParameter("password");
        md.update(a.getBytes());
        byte[] bytes = md.digest();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < bytes.length; i++) {
          sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
        }
        a = sb.toString();
        
        Employee employee = new Employee();
        employee.setName(request.getParameter("name"));
        employee.setPassword(a);
        employee.setPhone(Integer.parseInt(request.getParameter("phone")));
        employee.setEmail(request.getParameter("email"));
        
			employeeDao.registerEmployee(employee);
			response.sendRedirect("employeesuccess.jsp");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}