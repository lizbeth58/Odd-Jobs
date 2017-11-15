/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;
import java.io.Serializable;

/**
 *
 * @author elizabeth
 */
public class userBean implements Serializable {
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String role;

    public userBean(){

    }
    
    public userBean(userBean object){
        this.firstName = object.getFirstName();
        this.lastName = object.getLastName();
        this.email = object.getEmail();
        this.password = object.getPassword();
        this.role = object.getRole();
    }
    
    public userBean(String firstName, String lastName, String email, String password, String role){
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    
    public void setFirstName(String firstName){
        this.firstName = firstName;
    }
    
    public void setLastName(String lastName){
        this.lastName = lastName;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public void setPassword(String password){
        this.password = password;
    }
    public void setRole(String role){
        this.role = role;
    }
    
    public String getFirstName(){
        return  firstName;
    }
    public String getLastName(){
        return lastName;
    }
    public String getEmail(){
        return email;
    }
    public String getPassword(){
        return password;
    }
    public String getRole(){
        return role;
    }
}
