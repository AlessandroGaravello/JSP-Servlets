package com.solocrossfit.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.solocrossfit.model.Cliente;

public class ClienteDAO {
	private String endpoint = "jdbc:mysql://localhost:3306/hito3";
	private String user = "root";
	private String pass = "";
	
	public Connection conectar() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(endpoint, user, pass);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}//cierra conectar
	
	//insertar
	public void insertCliente(Cliente c) {
        
        // try-with-resource statement will auto close the connection.

        	Connection connection = conectar(); 
        	PreparedStatement ps;
	
				
					try {
						ps = connection.prepareStatement("INSERT INTO clientes (nombre,plan,competiciones,peso,horas) VALUES (?,?,?,?,?);");
						ps.setString(1, c.getNombre());
						ps.setString(2, c.getPlan());
						ps.setInt(3, c.getCompeticiones());
						ps.setString(4, c.getPeso());
						ps.setInt(5, c.getHoras());
						ps.executeUpdate();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}


				
    }//cierra insertar
	public Cliente selectCliente(String nombre1) {
	    Connection connection = conectar(); 
	    PreparedStatement ps;
	    Cliente cliente=null;
	    
	    try {
	        ps = connection.prepareStatement("SELECT * FROM clientes WHERE nombre= ?;");
	        ps.setString(1, nombre1);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            String nombre = rs.getString("nombre");

	            String plan = rs.getString("plan");

	            int competiciones = rs.getInt("competiciones");

	            String peso = rs.getString("peso");

	            int hora = rs.getInt("horas");



	            // Crear el objeto Cliente con los datos obtenidos

	            cliente = new Cliente(nombre, plan, competiciones, peso, hora);

	        }
	        
	        ps.close();
	        connection.close();
	        rs.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return cliente;
	}//cierra select

}
