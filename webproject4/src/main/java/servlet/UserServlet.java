package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import travellog.UserDAO;
import travellog.UserVO;

@WebServlet("*.do")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String[] uriParts = req.getRequestURI().split("/");
		String uri = uriParts[uriParts.length - 1];

		UserDAO dao = new UserDAO();

		try {
			switch (uri) {
			case "insert.do": {
				UserVO user = makeUserFromReq(req);
				dao.insertDB(user);
				resp.sendRedirect("login.jsp");
				break;
			}

			case "login.do": {
				String loginId = req.getParameter("loginId");
				String loginPw = req.getParameter("loginPw");
				UserVO user = dao.loginCheck(loginId, loginPw);

				if (user != null) {
					HttpSession session = req.getSession();
					session.setAttribute("loginId", user.getLoginId());
					session.setAttribute("loginName", user.getName());
					session.setAttribute("userInfo", user);
					resp.sendRedirect(req.getContextPath() + "/map.jsp");
				} else {
					HttpSession session = req.getSession(false);
					if (session != null) session.invalidate();
					resp.sendRedirect("login.jsp?error=1");
				}
				break;
			}

			case "logout.do": {
				HttpSession session = req.getSession(false);
				if (session != null) session.invalidate();
				resp.sendRedirect(req.getContextPath() + "/map.jsp");
				break;
			}

			case "doubleCheckId.do": {
				String id = req.getParameter("id");
				boolean isIdExist = dao.doubleCheckId(id);
				PrintWriter out = resp.getWriter();
				out.print(isIdExist);
				System.out.println("중복체크 id: " + id);

				break;
			}

			// 회원정보 수정 처리
			case "updateUser.do": {
				HttpSession session = req.getSession(false);
				if(session == null || session.getAttribute("userInfo") == null) {
					resp.sendRedirect("login.jsp");
					break;
				}

				UserVO user = makeUserFromReq(req);
				dao.updateUser(user);

				// 세션 업데이트
				session.setAttribute("userInfo", user);
				session.setAttribute("loginName", user.getName());

				resp.sendRedirect(req.getContextPath() + "/user/mypage.jsp");
				break;
			}

			default: {
				resp.sendRedirect("login.jsp");
				break;
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("login.jsp?error=1");
		}
	}

	// 요청 파라미터 → UserVO
	private UserVO makeUserFromReq(HttpServletRequest req) {
		UserVO user = new UserVO();
		user.setLoginId(req.getParameter("userid"));
		user.setLoginPw(req.getParameter("userpw"));
		user.setName(req.getParameter("name"));
		user.setPhoneNumber(req.getParameter("hp"));
		user.setEmail(req.getParameter("email"));
		user.setBirth(req.getParameter("birth"));
		return user;
	}
}
