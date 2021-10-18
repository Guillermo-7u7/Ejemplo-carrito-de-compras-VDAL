package com.tienda.modelo;


public class Persona {
    int idCliente;
    String dni;
    String nom;
    String dir;
    String email;
    String pass;
    
    public Persona(){
    }
    
    public Persona(int idCliente, String dni, String nom, String dir, String email, String pass){
        this.idCliente = idCliente;
        this.dni = dni;
        this.nom = nom;
        this.dir = dir;
        this.email = email;
        this.pass = pass;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    
}
