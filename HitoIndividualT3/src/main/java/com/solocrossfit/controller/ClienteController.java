package com.solocrossfit.controller;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.solocrossfit.dao.ClienteDAO;
import com.solocrossfit.model.Cliente;

/**
 * Servlet implementation class ClienteController
 */
@WebServlet("/")
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClienteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();
		
		
        switch (action) {
		case "/add":
			addCliente(request,response);
			break;
		case "/select":
			selectCliente(request,response);
			break;
			
		default:
			listClientes(request,response);
			break;
		}//cierra switch
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}
	

	private void listClientes(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void selectCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ClienteDAO dao=new ClienteDAO();
		String nombre1=request.getParameter("nombre1");
		Cliente cliente = dao.selectCliente(nombre1);
		
		if (cliente != null) {

	        // Obtiene los datos del cliente

	        String nombre = cliente.getNombre();

	        String plan = cliente.getPlan();

	        int competiciones = cliente.getCompeticiones();

	        String peso = cliente.getPeso();

	        int hora = cliente.getHoras();



	        // Establece los atributos en el objeto request

	        request.setAttribute("nombre", nombre);

	        request.setAttribute("plan", plan);

	        request.setAttribute("competiciones", competiciones);

	        request.setAttribute("peso", peso);

	        request.setAttribute("hora", hora);

	    }



	    // Redirige a mostrar-select.jsp

	    try {
			request.getRequestDispatcher("mostrar-cliente.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void addCliente(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String nombre=request.getParameter("nombre");
		String plan=request.getParameter("plan");
		int competiciones;
		if (request.getParameter("comp")== null) {

	    	competiciones = 0;

	    }else {

		    competiciones = Integer.parseInt(request.getParameter("comp"));

	    }
		String peso=request.getParameter("peso");
		int horas;
		if (request.getParameter("privado")== null) {

			horas = 0;

	    }else {

	    	horas = Integer.parseInt(request.getParameter("privado"));

	    }
		Cliente cliente=new Cliente(nombre,plan,competiciones,peso,horas);
		ClienteDAO dao=new ClienteDAO();
		dao.insertCliente(cliente);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
