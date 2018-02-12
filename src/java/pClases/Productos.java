/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pClases;

import java.io.Serializable;

/**
 *
 * @author Jose
 */
public class Productos implements Serializable {
    
    private Integer idProducto;
    private String nombre;
    private  String categorias;
    private  String categoriar;
    private String descripcion;
    private Integer existencia;
    private Double precio;
    private byte[] imagen;
    private byte[] imageng;

    public Productos() {
    }

    public Productos(Integer idProducto, String nombre, String categorias, String categoriar, String descripcion, Integer existencia, Double precio, byte[] imagen) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.categorias = categorias;
        this.categoriar = categoriar;
        this.descripcion = descripcion;
        this.existencia = existencia;
        this.precio = precio;
        this.imagen = imagen;
    }

    public Productos(Integer idProducto, String nombre, String categorias, String categoriar, String descripcion, Integer existencia, Double precio, byte[] imagen, byte[] imageng) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.categorias = categorias;
        this.categoriar = categoriar;
        this.descripcion = descripcion;
        this.existencia = existencia;
        this.precio = precio;
        this.imagen = imagen;
        this.imageng = imageng;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategorias() {
        return categorias;
    }

    public void setCategorias(String categorias) {
        this.categorias = categorias;
    }

    public String getCategoriar() {
        return categoriar;
    }

    public void setCategoriar(String categoriar) {
        this.categoriar = categoriar;
    }

   

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getExistencia() {
        return existencia;
    }

    public void setExistencia(Integer existencia) {
        this.existencia = existencia;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public byte[] getImagen() {
        return imagen;
    }

    public void setImagen(byte[] imagen) {
        this.imagen = imagen;
    }
    
    
    
    
    
    
}
