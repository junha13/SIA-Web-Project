package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import travellog.PostDAO;
import travellog.PostVO;

@WebServlet(urlPatterns = {"/post/location.do", "/post/view.do", "/post/insert.do"})
public class PostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		// 요청 url 가져오고(/post/xxx.do), db 연동할 DAO 객체 생성
		String path = req.getServletPath();
		PostDAO dao = new PostDAO();

		// switch로 url에 따라 분기 처리
		try {
			switch (path) {
			// 글 저장 (post-write.jsp) 후 그 글의 아이디 반환
				case "/post/insert.do": {
					PostVO post = new PostVO();
					post.setPostTitle(req.getParameter("title"));
					post.setPostLocation(req.getParameter("location"));
					post.setPostContent(req.getParameter("contentHtml"));
			
					// 새 글 저장 후 그 글의 아이디 반환 (상세페이지 이동해야 돼서)
					int newId = dao.insertDB(post);
			
					// 저장 후 바로 상세페이지 이동 (postView.jsp)
					res.sendRedirect(req.getContextPath() + "/post/view.do?pkid=" + newId);
					return;
				}
		
				// 상세 (postView.jsp)
				case "/post/view.do": {
					String pkid = req.getParameter("pkid"); // 글 id 가져오기
					PostVO post = dao.getPostById(Integer.parseInt(pkid));
					req.setAttribute("post", post);
					req.getRequestDispatcher("/post/postView.jsp").forward(req, res);
					return;
				}
		
				// 목록(지역별)
				case "/post/location.do":
				default: {
					String location = req.getParameter("location");
					List<PostVO> list = dao.getPostByPostId(location);
					req.setAttribute("location", location);
					req.setAttribute("list", list);
					req.getRequestDispatcher("/post/post-list.jsp").forward(req, res);
					return;
				}
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
		
}

