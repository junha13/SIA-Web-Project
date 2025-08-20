package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travellog.UserVO;


@WebServlet("*.do")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String[] uriParts = req.getRequestURI().split("/");
		String uri = uriParts[uriParts.length - 1];
		
		try {
			switch (uri) {
				case "/insert.do" : {
					UserVO user = makeUserFromReq(req);
				}
				
				case "/ddd" : {
					
				}
		
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private UserVO makeUserFromReq(HttpServletRequest req) {
		UserVO user = new UserVO();
		user.setLoginId(req.getParameter(""); // 요청 준걸 여기서 받아야됨
		
	}

}
