package khj;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import z01_vo.*;
import z01_vo.Nk;

public class A02_serviceCenterService {
	private A02_serviceCenterDao dao;
	public A02_serviceCenterService() {
		super();
		dao = new A02_serviceCenterDao();
	}
	
	// 공지리스트 불러오기
	public ArrayList<Notice> Notice(HttpServletRequest request) {
		return dao.nlist();
	}
	
	public Notice noticeDetail(HttpServletRequest request) {
		int noti_no = Nk.toInt(request.getParameter("noti_no"));
		
		return dao.ndetail(noti_no);
	}

	public void insertNotice(HttpServletRequest request) {
		String noti_name = Nk.toStr(request.getParameter("noti_name"));
		String noti_detail = Nk.toStr(request.getParameter("noti_detail"));
		
		Notice noti = new Notice(noti_name, noti_detail);
		dao.insertNotice(noti);
	}
	
	public void updateNotice(HttpServletRequest request) {
		int noti_no = Nk.toInt(request.getParameter("noti_no"));
		String noti_name = Nk.toStr(request.getParameter("noti_name"));
		String noti_detail = Nk.toStr(request.getParameter("noti_detail"));
		
		Notice noti = new Notice(noti_no, noti_name, noti_detail);
		dao.updateNotice(noti);
	}

	public void deleteNotice(HttpServletRequest request) {
		int noti_no = Nk.toInt(request.getParameter("noti_no"));
		
		dao.deleteNotice(noti_no);
	}

	public ArrayList<Question> Question(HttpServletRequest request) {
		return dao.qlist();
	}

	public Question questionDetail(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		return dao.qdetail(que_no);
	}

	public ArrayList<Quecomm> Quecomm(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		return dao.qclist(que_no);
	}
	
	public void insertQuestion(HttpServletRequest request) {
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String que_name = Nk.toStr(request.getParameter("que_name"));
		String que_detail = Nk.toStr(request.getParameter("que_detail"));
		
		Question que = new Question(mem_id, que_name, que_detail);
		dao.insertQuestion(que);
	}
	
	public void updateQuestion(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		String mem_id = Nk.toStr(request.getParameter("mem_id"));
		String que_name = Nk.toStr(request.getParameter("que_name"));
		String que_detail = Nk.toStr(request.getParameter("que_detail"));
		
		Question que = new Question(que_no, mem_id, que_name, que_detail);
		dao.updateQuestion(que);
	}
	
	public void deleteQuestion(HttpServletRequest request) {
		int que_no = Nk.toInt(request.getParameter("que_no"));
		
		dao.deleteQuecommAll(que_no);
		dao.deleteQuestion(que_no);
	}
}		

