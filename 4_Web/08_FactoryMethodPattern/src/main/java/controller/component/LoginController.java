package controller.component;

import java.sql.SQLException;

import com.kh.model.dao.ClientDAO;

import controller.Controller;
import controller.ModelAndView;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginController implements Controller {

	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		ClientDAO dao = new ClientDAO();
		dao.login(id, password);
		
		return new ModelAndView("index.jsp", true);
	}
}
