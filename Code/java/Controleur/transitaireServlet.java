package Controleur;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.BddConnect;

	

/**
 * Servlet implementation class transitaireServlet
 */
	
@WebServlet("/transitaireServlet")
public class transitaireServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BddConnect bdd= new BddConnect();
       
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String destination = request.getParameter("destination");
		String dateDepart = request.getParameter("date");
		String heureDepart = request.getParameter("time");
		String jourDepart = dateDepart+" "+heureDepart;
		System.out.println(jourDepart);
		
		bdd.connexionBdd();
		try {
			bdd.requetePrepare(destination,jourDepart);
			System.out.println("reussi destination");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		getServletContext().getRequestDispatcher("/vueTransitaire.jsp").forward(request, response);
	}



}
