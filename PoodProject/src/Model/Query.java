/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JComboBox;

/**
 *
 * @author HP2017-08
 */
public class Query extends Koneksi {
    
    Connection con;
    Statement stm;
    ResultSet rss;
    
    public Boolean InUpDel(String query)
    {
      con=GetCon();
      try
      {
      stm = con.createStatement();
      stm.executeUpdate(query);
      return true;
 /*     if(stm.executeUpdate(query) != 0)
        {
         return true;
        }else
            {
             return false;
            }*/
      }
      catch(SQLException e)
      {
      System.out.println("Query Error"+e.getMessage());
      return false;
      }
    }
   
    public void ShowBox(String query,String fild,JComboBox cb)
    {
      con=GetCon();
      try
      {
       stm = con.createStatement();   
      rss = stm.executeQuery(query);
        while(rss.next())
        {
        cb.addItem(rss.getString(fild));
        }
      }
      catch(SQLException e)
      {
      cb.addItem("Null");
      System.out.print(e.getMessage());
      }
    }
    
     public String GetData(String query,String fild)
    {
      con=GetCon();
      try
      {
       stm = con.createStatement();   
      rss = stm.executeQuery(query);
       rss.next();
       return rss.getString(fild);
      }
      catch(SQLException e)
      {
       System.out.print(e.getMessage());   
      return null;
      }
    }
    
}
