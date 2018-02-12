/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pClases;

import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author luis
 */
public class EncriptadoMD5 {

    public static void main(String[] args) {
        String textoSinEncriptar = "123";
        String textoEncriptadoConMD5 = DigestUtils.md5Hex(textoSinEncriptar);
        System.out.println("Texto Encriptado con MD5 : " + textoEncriptadoConMD5);
        //202cb962ac59075b964b07152d234b70
    }
}
