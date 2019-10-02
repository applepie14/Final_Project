package action;

// 기능은 다르지만 요청을 받아서 처리해주는 메소드를
// 공통의 메소드를 작성하기 위해서 인터페이스를 작성
import javax.servlet.http.*; //HttpServletrequest, HttpServletResponse

public interface CommandAction {
	//이동할 페이지의 경로와 페이지명이 필요 반환값(String), 스프링은(ModelAndView)
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws Throwable;
}
