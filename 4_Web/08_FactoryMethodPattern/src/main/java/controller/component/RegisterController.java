package controller.component;

import java.sql.SQLException;

import com.kh.model.dao.ClientDAO;

import Client.vo.Client;
import controller.Controller;
import controller.ModelAndView;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
  컴포넌트
  - 인터페이스 기반으로 작성된 재사용성이 강한 자바 클래스 
 */
public class RegisterController implements Controller {
	
	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) throws SQLException {
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	Client client = new Client(id, password, name);
	
	ClientDAO dao = new ClientDAO();
	dao.register(id, password, name);


		return new ModelAndView("index.jsp", true);
}

}