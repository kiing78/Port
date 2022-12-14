package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BddConnect  {
	private Connection cnx;
	private Statement stmt;

public void chargerDriver() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver trouve!");
			
		} catch (ClassNotFoundException e) {
			
			System.out.println("Driver NON trouve!");
		}
	}

public void bddConnect() {
	try {
		cnx = DriverManager.getConnection("jdbc:mysql://localhost/projet_port", "root", "");
		System.out.println("BDD trouvee!");
	} catch (SQLException e) {
		
		System.out.println("BDD NON trouvee!");
	}
}

	public String requetePrepare(String dest,String jourDepart) throws SQLException {
		PreparedStatement stmt2 = cnx.prepareStatement("\r\n"
				+ "select nom_tra,siret_tra\r\n"
				+ "from transitaire tra \r\n"
				+ "inner join acheminement ach on tra.idTra = ach.idTra\r\n"
				+ "inner join destination des on ach.idAch=des.idAch\r\n"
				+ "inner join est_contenu_dans conte on ach.idAch = conte.id_ach\r\n"
				+ "inner join cargaison car on conte.id_car=car.idCar\r\n"
				+ "where nom_des=?\r\n"
				+ "and jour_depart=?");
		//1er point d'interrogation c'est destination, en gros on mettra en argument la destination
		stmt2.setString(1,dest);
		stmt2.setString(2,jourDepart);
		ResultSet res2=stmt2.executeQuery();
		res2.next();
		//récupère le nom du transitaire de la colonne nom_tra dans la BDD
		String n =res2.getString("nom_tra");
		System.out.println(n);
		
		return n;
	}

public void connexionBdd() {
	this.chargerDriver();
	this.bddConnect();
}



    
	
			


	

}
