package Controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class vueServlet
 */
@WebServlet("/vueServlet")
public class vueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String VUE="/WEB-INF/vue.jsp";
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("/vue.jsp").forward(request, response);
	}



}
