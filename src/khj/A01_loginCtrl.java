package khj;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import z01_vo.Member;

/**
 * Servlet implementation class A01_loginCtrl
 */
@WebServlet(name = "login", urlPatterns = { "/login" })
public class A01_loginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A01_loginService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_loginCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new A01_loginService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청
		String proc = request.getParameter("proc");
		// 아이디 중복 확인 요청
		String mem_id = request.getParameter("mem_id");
		
		if(proc==null) proc="";
		System.out.println("proc확인"+proc);
		// 2. 모델
		//    1) 로그인 했을 때..
		if(proc.equals("login")) {
			// DB처리를 통해 Member객체가 있을 때, Session 처리..	
			Member mem = service.login(request);
			if(mem!=null) {
				// Session 입력처리 완료..
				HttpSession session = request.getSession();
				session.setAttribute("mem", mem);
			}
		}
		// 회원가입 아이디 중복 확인
		if(mem_id!=null&& !mem_id.equals("")) {
			// id 있는지 여부 service에서 확인..
			request.setAttribute("isMember", service.checkReg(mem_id));
		}
		
		if(proc.equals("logout")) {
			// 로그아웃 클릭시, session값을 없애는 처리..
			request.getSession().invalidate();
		}
		// 3. 화면 main\\login\\login.jsp
		String page="main/login/login.jsp";
		// 메인페이지
		if(proc.equals("main")) {
			page="main/main.jsp";
		}
		// 로그인페이지 -> 회원가입
		if(proc.equals("signUp")) {
			page="main/login/signUp.jsp";
		}
		// 회원테이블에 입력값 저장
		if(proc.equals("insMem")) {
			System.out.println("저장확인");
			service.insMem(request);
			page="main/login/login.jsp";
		}
		
		// 로그인페이지 -> 아이디 찾기
		if(proc.equals("findID")) {
			page="main/login/findID.jsp";
		}
		// 로그인페이지 -> 비밀번호 찾기
		if(proc.equals("findPS")) {
			page="main/login/findPS.jsp";
		}
		RequestDispatcher rd= request.getRequestDispatcher(page);
		rd.forward(request, response);
		// 중복확인
		RequestDispatcher rd2 = request.getRequestDispatcher("main/login/signUp.jsp");
		rd2.forward(request, response);
		
	}
}
