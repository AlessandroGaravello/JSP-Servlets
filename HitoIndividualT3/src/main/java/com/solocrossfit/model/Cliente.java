package com.solocrossfit.model;

public class Cliente {
	public String nombre;
	public String plan;
	public int competiciones;
	public String peso;
	public int horas;
	public Cliente(String nombre, String plan, int competiciones, String peso, int horas) {
		super();
		this.nombre = nombre;
		this.plan = plan;
		this.competiciones = competiciones;
		this.peso = peso;
		this.horas = horas;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public int getCompeticiones() {
		return competiciones;
	}
	public void setCompeticiones(int competiciones) {
		this.competiciones = competiciones;
	}
	public String getPeso() {
		return peso;
	}
	public void setPeso(String peso) {
		this.peso = peso;
	}
	public int getHoras() {
		return horas;
	}
	public void setHoras(int horas) {
		this.horas = horas;
	}
}
