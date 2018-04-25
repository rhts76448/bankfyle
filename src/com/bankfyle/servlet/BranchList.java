package com.bankfyle.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bankfyle.bean.bank;
import com.bankfyle.db.CRUD;

/**
 * Servlet implementation class BranchList
 */
@WebServlet("/BranchList")
public class BranchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BranchList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String city=request.getParameter("city");
		String bank=request.getParameter("bank");
		bank[] branch=CRUD.getBankBranch(city.toUpperCase(), bank.toUpperCase());
		HttpSession session=request.getSession();
		session.setAttribute("bank",bank);
		session.setAttribute("city", city);
		session.setAttribute("branch", branch);
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/BranchList.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
