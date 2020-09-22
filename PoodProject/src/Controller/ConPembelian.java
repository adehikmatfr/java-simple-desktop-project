/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.Query;//name space 
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JButton;
import javax.swing.JComboBox;



/**
 *
 * @author HP2017-08
 */
public class ConPembelian 
{
    //inisialisasi/ intansiasi class jadi objek 
    //button set
    Query qr=new Query();  
     
    public int SetQuery(String mn,String qty,String hrg,String idpe,int opsi)
    {
       String id= qr.GetData("Select * from makanan where Nama='"+mn+"'", "MakananID");
       System.out.println(id);
      if(opsi==1)
      {
        String ins;
        //problem auto increment not a run in java
        String lsid=qr.GetData("SELECT * FROM penjualan order by PenjualanID desc", "PenjualanID");
        int idp=Integer.parseInt(lsid)+1;
        Date dt=new Date();
        SimpleDateFormat sfd=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        ins="Insert into penjualan values("+idp+","+id+","+qty+","+hrg+",'"+sfd.format(dt)+"')";
        System.out.println(ins);
        System.out.print(qr.InUpDel(ins));
        if(qr.InUpDel(ins))
        {
        return 1;
        }
        else
        {
        return 1;
        }
      }
      else if(opsi==2)
      {
        String upd="UPDATE penjualan SET MakananID='"+id+"',Qty="+qty+",Harga="+hrg+" WHERE PenjualanID='"+idpe+"'";
        System.out.println(upd);
        System.out.print(qr.InUpDel(upd));
        if(qr.InUpDel(upd))
        {
        return 1;
        }
        else
        {
        return 1;
        }
      }
      else
      {
      String del="DELETE From penjualan WHERE PenjualanID='"+idpe+"'";
        System.out.println(del);
        System.out.print(qr.InUpDel(del));
        if(qr.InUpDel(del))
        {
        return 1;
        }
        else
        {
        return 1;
        }
      }
    }
    
     public void Awal(JComboBox cb)
     {
      qr.ShowBox("Select * from makanan", "Nama", cb);
     }
    
     
}
