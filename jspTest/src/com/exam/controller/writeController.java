package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exam.dao.bbsDAO;
import com.exam.dto.bbsDTO;

public class writeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("write.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String sessionID = (String) session.getAttribute("sessionID");
		if(sessionID == null) {
			sessionID = "ºñÈ¸¿ø";
		}
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		bbsDAO bDAO = bbsDAO.getInstance();
		bbsDTO bbsDTO = new bbsDTO();
		
		bbsDTO.setTitle(title);
		bbsDTO.setContent(content);
		bbsDTO.setWriter(sessionID);
		
		int wResult = bDAO.write(bbsDTO);
		resp.sendRedirect("main.jsp");
	}
	

}
