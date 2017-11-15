/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import beans.entryBean;
import beans.userBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author elizabeth
 */
public class DButils {
    private static final String dbURL = "jdbc:mysql://localhost:3306/oddJobs";
    private static final String username = "root";
    private static final String pword = "F123ed0m4!";
    
    public static void setPost(entryBean entry){
        
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
               
           String query ="INSERT INTO `oddJobs`.`Entry` (`user`,`name`,`location`,`phone`,`content`)"
                   + "VALUES ('"+entry.getUsername()+"','"+entry.getName()+"','"+entry.getLocation()+"','"+entry.getPhone()+"','"+entry.getContent()+"'); ";

           Statement statement = connection.createStatement();
           statement.executeUpdate(query);
           
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
    }
    
    public static List<entryBean> getEntry(String email){
         List<entryBean> entries = new ArrayList<>();
        entryBean bean = new entryBean();
        
        try{
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
           
           Statement statement = connection.createStatement();
           String query = "Select * From Entry WHERE user = '"+email+ "' ";

           ResultSet rs = statement.executeQuery(query);
           
           while(rs.next()){
               String username = rs.getString("user");
               String name = rs.getString("name");
               String location = rs.getString("location");
               String phone = rs.getString("phone");
               String content = rs.getString("content");
               
               bean = new entryBean(username,name,location,phone,content);
               entries.add(bean);
               
           }
           rs.close();
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
        
        return entries;
    }
    
    public static List<entryBean> getEntries(){
        List<entryBean> entries = new ArrayList<>();
        entryBean bean = new entryBean();
        
        try{
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
           
           Statement statement = connection.createStatement();
           String query = "Select * From Entry";

           ResultSet rs = statement.executeQuery(query);
           
           while(rs.next()){
               String username = rs.getString("user");
               String name = rs.getString("name");
               String location = rs.getString("location");
               String phone = rs.getString("phone");
               String content = rs.getString("content");
               
               bean = new entryBean(username,name,location,phone,content);
               entries.add(bean);
               
           }
           rs.close();
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
        
        return entries;
    }
    
    public static void deletePost(String content){
        try{
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
           
           Statement statement = connection.createStatement();
           String query = "DELETE FROM `oddJobs`.`Entry` WHERE `content`='"+content+"';";

           int row = statement.executeUpdate(query);
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
    }
    public static void deleteUser(String email){
       
        try{
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
           
           Statement statement = connection.createStatement();
           String query = "DELETE FROM `oddJobs`.`users` WHERE `email`='"+email+"';";

           int row = statement.executeUpdate(query);
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
    }
    
    public static void updateUser(String firstName, String lastName, String email, String curEmail){
       
        try{
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
           
           Statement statement = connection.createStatement();
           String query = "UPDATE `oddJobs`.`users` SET `first_name`='"+firstName+"', `last_name`='"+lastName+"', `email`='"+email+"' WHERE `email`='"+curEmail+"';";
           int row = statement.executeUpdate(query);
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
    }
    
    public static userBean getUser(String uname){
       userBean bean = new userBean();
       
        try{
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
           
           Statement statement = connection.createStatement();
           
           ResultSet rs = statement.executeQuery("Select * From oddJobs.users where email = '"+uname+"'");
           rs.next();
           
           String first_name = rs.getString("first_name");
           String last_name = rs.getString("last_name");
           String email = rs.getString("email");
           String password = "null";
           String role = "user";
           
           bean = new userBean(first_name,last_name,email,password,role);
           
           rs.close();
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
       
       return bean;
    }
    
   
    
    
    public static List<userBean> getUsers(){
        List<userBean> users = new ArrayList<>();
        userBean bean = new userBean();
        
        try{
            Class.forName("com.mysql.jdbc.Driver");;
            Connection connection = DriverManager.getConnection(dbURL,username,pword);
               
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("Select * From users");
               
            while(rs.next()){
                String first_name = rs.getString("first_name");
                String last_name = rs.getString("last_name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                String role = rs.getString("role");
                bean = new userBean(first_name,last_name,email,password,role);
                users.add(bean);
            }
          
            rs.close();
            stmt.close();
            connection.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return users;
    }
   
   public static void setUser(userBean user){
       
     try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
               
           String query ="INSERT INTO `oddJobs`.`users` (`first_name`, `last_name`, `email`, `role`, `password`)"
                   + "VALUES ('"+user.getFirstName()+"','"+user.getLastName()+"','"+user.getEmail()+"','user','"+user.getPassword()+"'); ";

           Statement statement = connection.createStatement();
           statement.executeUpdate(query);
           
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
   }
   
   
   
   
   public static boolean authenticate(String uname, String password){
       boolean isUser = false;
       
       try{
           
           Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection(dbURL,username,pword);
               
           String query ="select * from users where email = '"+uname+"'";
           
           Statement statement = connection.createStatement();
           
           ResultSet rs = statement.executeQuery(query);
           rs.next();
           
            if(rs.getString("password").equals(password)){
               isUser = true;
            }
           
           rs.close();
           statement.close();
           connection.close();
        }catch(Exception e){
           e.printStackTrace();
        }
       return isUser;
   }
    
}
