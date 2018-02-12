/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pClases;

import java.util.Random;

/**
 *
 * @author luis
 */
public class GenPass {
    private String pass;

    public GenPass() {
        this.pass = new String();
        Random ran = new Random();
        for(int i = 0; i < 8; i ++){
            switch(ran.nextInt(3-1+1)+1){
                case 1: this.pass+= (char)(ran.nextInt(57-48+1)+48);
                        break;
                case 2: 
                        this.pass+= (char) (ran.nextInt(90-65+1)+65);
                        break;
                case 3:
                        this.pass+= (char) (ran.nextInt(122-97+1)+97);
                        break;
            }
        }
    }

    public String getPass() {
        return pass;
    }
    
}
