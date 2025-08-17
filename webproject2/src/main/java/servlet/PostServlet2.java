package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import travellog.PostDAO;
import travellog.PostVO;

//요청을 받아 DAO를 호출하고 결과를 JSP에 전달 ---> setAttribute로 region 넘겨주기!!!!!!!!!!!
@WebServlet("*.post")
public class PostServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String[] uriParts = req.getRequestURI().split("/"); // 받아온 URI 스플릿으로 잘라서 리스트에 저장
		String uri = uriParts[uriParts.length - 1]; // 마지막꺼 uri에 저장 (switch문에서 분기점으로 사용하려고) 
		
		PostDAO dao = new PostDAO();
		
		String forwardPage = "";
		try {
			switch (uri) {
				case "insert.post" : {			
					PostVO post = makePostFromReq(req);
					int pkId = dao.insertDB(post);
					res.sendRedirect(req.getContextPath() + "/view.post?pkid=" + pkId);
					return;
				}
				case "view.post" : {
					int id = Integer.parseInt(req.getParameter("pkid"));
					PostVO post = dao.getPostById(id);
					req.setAttribute("post", post);
					
					forwardPage = "postView.jsp";
					req.getRequestDispatcher("/post/postView.jsp").forward(req, res);
					
					return;
				}
				case "location.post" : {
					String location = req.getParameter("location");
					List<PostVO> list = dao.getPostByPostId(location);
					req.setAttribute("location", location);
					req.setAttribute("list", list);
					req.getRequestDispatcher("/post/post-list.jsp").forward(req, res);
					return;	
				}
				case "ajax.post" : {
					String q =req.getParameter("input");  // 입력한 키워드 받고
					res.setContentType("application/json; charset=UTF-8");
					List<String> suggestions = dao.suggestLocationByInputData(q);  // q로 메서드 넣어서 list뽑기
					res.getWriter().write(new Gson().toJson(suggestions));  // 여기는 gson배웠던거 suggestions을 json형식으로 보내는거
					return;
				}
				case "locationCheck.post" : {
					String loctionInput = req.getParameter("location");
					res.setContentType("application/json; charset=UTF-8");
					boolean result = dao.locationInputCheck(loctionInput);
					res.getWriter().write(new Gson().toJson(result)); 
					return;
				}
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private PostVO makePostFromReq(HttpServletRequest req) { // 회원가입 jsp에서 정보 받아와서 user 리턴
		PostVO post = new PostVO();
		post.setPostTitle(req.getParameter("title")); // 요청 준걸 여기서 받아야됨
		post.setPostLocation(req.getParameter("location"));
		post.setPostContent(req.getParameter("contentHtml"));
		return post;
	}
}
