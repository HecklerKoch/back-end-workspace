package controller.component;

import com.kh.model.vo.Client;
import controller.Controller;
import controller.ModelAndView;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutController implements Controller {
	
	@Override
	public ModelAndView handle(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Client client = (Client) session.getAttribute("client");
		if(client!=null) {
			session.invalidate();
		}
		return new ModelAndView("index.jsp", true);
	}
}
