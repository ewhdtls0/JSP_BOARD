package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.bbsDAO;
import com.exam.dto.bbsDTO;

public class bbsUpdateController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bbsId = req.getParameter("bbsId");
		bbsDAO bDAO = bbsDAO.getInstance();
		bbsDTO bDTO = new bbsDTO();
		bDTO = bDAO.selectById(bbsId);
		
		req.setAttribute("bbsUpdate", bDTO);
		RequestDispatcher rd = req.getRequestDispatcher("bbsUpdate.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String bbsId = req.getParameter("bbsId");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		bbsDAO bDAO = bbsDAO.getInstance();
		bbsDTO bDTO = new bbsDTO();
		bDTO.setBbsId(Integer.parseInt(bbsId));
		bDTO.setTitle(title);
		bDTO.setContent(content);
		
		bDAO.update(bDTO);
		resp.sendRedirect("main.jsp");
		
	}

}
