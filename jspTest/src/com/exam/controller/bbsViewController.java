package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.bbsDAO;
import com.exam.dto.bbsDTO;

public class bbsViewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bbsId = req.getParameter("bbsId");
		bbsDAO bDAO = bbsDAO.getInstance();
		bbsDTO bDTO = new bbsDTO();
		bDTO = bDAO.selectById(bbsId);
		
		req.setAttribute("bbsView", bDTO);
		
		RequestDispatcher rd = req.getRequestDispatcher("bbsView.jsp");
		rd.forward(req, resp);
	}

}
