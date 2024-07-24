package session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import com.kh.model.dao.ClientDAO;

import Client.vo.Client;

@WebServlet ("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		ClientDAO dao = new ClientDAO();
		Client client = null;
		
		try {
			client = dao.searchClient(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("search", client);
		
		request.getRequestDispatcher("/views/search_ok.jsp").forward(request, response);
	}
	
}
