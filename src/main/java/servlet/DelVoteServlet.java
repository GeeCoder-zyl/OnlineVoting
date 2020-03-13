package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VoteItemDao;
import dao.VoteOptionDao;
import dao.VoteSubjectDao;
import entity.VoteSubject;

/**
 * Servlet implementation class DelVoteServlet
 */
@WebServlet("/DelVoteServlet")
public class DelVoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DelVoteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vsId = request.getParameter("vsId");
		System.out.println(vsId);
		VoteSubjectDao vsd = new VoteSubjectDao();
		VoteOptionDao vod = new VoteOptionDao();
		VoteItemDao vid = new VoteItemDao();
		vid.deleteVoteItem(vsId);
		vod.deleteVoteOption(vsId);
		vsd.deleteVoteSubject(vsId);
		List<VoteSubject> allVotesList = new ArrayList<VoteSubject>();
		allVotesList = vsd.searchAllVoteSubject();
		request.getSession().setAttribute("allVotesList", allVotesList);
		request.getRequestDispatcher("/voteMaintenanceList.jsp").forward(request, response);

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
