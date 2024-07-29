package controller.component;

import java.sql.SQLException;

import com.kh.model.dao.ClientDAO;

import controller.Controller;
import controller.ModelAndView;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class SearchController implements Controller {
	
	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String id = request.getParameter("id");
		
		ClientDAO dao = new ClientDAO();
		dao.searchClient(id);
		
		return new ModelAndView("index.jsp", true);
	}
}
