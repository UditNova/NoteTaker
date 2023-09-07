package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SaveNoteServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			
			//fetching data from form
			String title = request.getParameter("note_title");
			String content = request.getParameter("note_content");
			
			/* making note class object to save fetched data */
			Note note=new Note(title, content, new Date());
			
			//System.out.println(note.getId()+" "+note.getTitle()+" "+ note.getContent()+" "+note.getAddedDate());
			//saving the object into database
			Session s = FactoryProvider.getfactory().openSession();
			
			Transaction tx=s.beginTransaction();
			
			s.save(note);
			
			tx.commit();
			
			s.close();
			response.setContentType("text/html");
			PrintWriter out= response.getWriter();
			out.println("<body background-color='#333333'><h1 style='text:center; color:green;'>Saved sucessfully</h2>"
					+ "<br> <h2><a style='text-align:center;' href='all_notes.jsp'>View all notes</a></h2><br>"
					+ "<h2><a style='text-align:center;' href='index.jsp'> Go to home </a></h2></body>");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
