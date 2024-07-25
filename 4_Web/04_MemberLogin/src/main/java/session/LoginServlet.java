package session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.kh.model.dao.ClientDAO;

import Client.vo.Client;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		ClientDAO dao = new ClientDAO();
		try {
			Client client = dao.login(id, password);
			
			//바인딩 - session
			HttpSession session = request.getSession();
			session.setAttribute("pi", client);
			
			response.sendRedirect("/index.jsp");
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
