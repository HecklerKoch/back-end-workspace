package session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.model.dao.ClientDAO;

import Client.vo.Client;

@WebServlet ("/allMember")
public class SearchAll extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClientDAO dao = new ClientDAO();
		ArrayList<Client> Clientlist = null;
		
		try {
			Clientlist = dao.showAllClient();
		
			request.setAttribute("allList", Clientlist);
			
			request.getRequestDispatcher("/views/allMember.jsp").forward(request, response);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
