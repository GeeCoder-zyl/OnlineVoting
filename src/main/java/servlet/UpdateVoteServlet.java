package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VsVoDao;
import entity.VoteOption;
import entity.VoteSubject;

/**
 * Servlet implementation class UpdateVoteServlet
 */
@WebServlet("/UpdateVoteServlet")
public class UpdateVoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateVoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vsId = request.getSession().getAttribute("vsId").toString();
		String vsTitle = request.getParameter("vs_title");
		String vsType = request.getParameter("vs_type");
		String[] voId = request.getParameterValues("vo_id");
		String[] voOption = request.getParameterValues("vo_option");
		String voOrder = "0";
		String[] delOptions = request.getParameterValues("del_options");

		VoteSubject vs = new VoteSubject();
		VoteOption vo = new VoteOption();
		VsVoDao sod = new VsVoDao();

		vs.setVsId(vsId);
		vs.setVsTitle(vsTitle);
		vs.setVsType(vsType);
		vo.setVoOption(voOption);
		vo.setVoOrder(voOrder);

		for (int i = 0; i < voOption.length; i++) {
			if (voOption[i].trim() == null || voOption[i].trim() == "") {
				request.setAttribute("voOptionError", "投票选项不能为空");
				request.getRequestDispatcher("publishNewVote.jsp").forward(request, response);
			} else if (voOption[i].length() > 100) {
				request.setAttribute("voOptionError", "投票选项超过100个字符");
				request.getRequestDispatcher("publishNewVote.jsp").forward(request, response);
			}
		}
		if (vsTitle.trim() == null || vsTitle.trim() == "") {
			request.setAttribute("vsTitleError", "投票名称不能为空");
			request.getRequestDispatcher("publishNewVote.jsp").forward(request, response);
		} else if (vsTitle.length() > 200) {
			request.setAttribute("vsTitleError", "投票名称超过200个字符");
			request.getRequestDispatcher("publishNewVote.jsp").forward(request, response);
		} else {
			try {
				if (delOptions == null) {
					if (sod.updateVote(vs, vo, voId)) {
						response.sendRedirect("SearchVotesServlet?jsp=voteList");
					} else {
						request.setAttribute("error", "编辑投票失败");
						request.getRequestDispatcher("editVote.jsp").forward(request, response);
					}
				} else {
					if (sod.updateVote2(vs, vo, voId, delOptions)) {
						response.sendRedirect("SearchVotesServlet?jsp=voteList");
					} else {
						request.setAttribute("error", "编辑投票失败");
						request.getRequestDispatcher("editVote.jsp").forward(request, response);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
