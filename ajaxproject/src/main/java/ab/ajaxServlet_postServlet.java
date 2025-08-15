package ab;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.google.gson.Gson;


/**
 * Servlet implementation class AddrbookServlet
 */
@WebServlet("*.post")  
public class ajaxServlet_postServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
    ajaxDAO_postDAO dao = new ajaxDAO_postDAO();   
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri = req.getRequestURI();
		String action = req.getParameter("action");
		
		try {
		if(uri.endsWith("ajax.post")) { // 이거 그대로 switch문에 넣으면 될듯 // jsp의 input값이 입력될때마다 여기 요청하는거임
			String q =req.getParameter("q");  // 입력한 키워드 받고
			res.setContentType("application/json; charset=UTF-8");
			List<String> suggestions = dao.suggestLocationByInputData(q);  // q로 메서드 넣어서 list뽑기
			res.getWriter().write(new Gson().toJson(suggestions));  // 여기는 gson배웠던거 suggestions을 json형식으로 보내는거

		}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
