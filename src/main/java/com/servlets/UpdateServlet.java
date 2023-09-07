package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetching data from form
		int id=Integer.parseInt(request.getParameter("note_id").trim());
		String title = request.getParameter("note_title");
		String content = request.getParameter("note_content");
		
		Session s = FactoryProvider.getfactory().openSession();
		
		Transaction tx=s.beginTransaction();
		
		Note note= s.get(Note.class, id);
		note.setTitle(title);
		note.setContent(content);
		
		tx.commit();
		s.close();
		response.sendRedirect("all_notes.jsp");
		
	}

}
