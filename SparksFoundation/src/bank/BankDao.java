package bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class BankDao {
	
	Connection getcon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/spark","root","1234");
		return con;
	}

	public List<BankBean> view() throws ClassNotFoundException, SQLException
	{Connection con=getcon();
		String qr="select * from users";
		Statement s=con.createStatement();
		ResultSet rs=s.executeQuery(qr);
		ArrayList <BankBean> l= new ArrayList<BankBean>();
	while(rs.next())
	{BankBean b=new BankBean();
			b.setId(rs.getInt(1));
			b.setName(rs.getString(2));
			l.add(b);
	}
		return l;
	}
	public List<History> history() throws ClassNotFoundException, SQLException
	{Connection con=getcon();
		String qr="select * from history";
		Statement s=con.createStatement();
		ResultSet rs=s.executeQuery(qr);
		ArrayList <History> l= new ArrayList<History>();
	while(rs.next())
	{History b=new History();
			b.setRef_id(rs.getString(1));
			b.setTo(rs.getString(2));
			b.setFrom(rs.getString(3));
			b.setAmount(rs.getString(4));
			b.setDate(rs.getString(5));
			b.setTime(rs.getString(6));
			
			
			l.add(b);
	}
		return l;
	}
	
	
	
	public List<BankBean> transferview(int id) throws ClassNotFoundException, SQLException
	{Connection con=getcon();
		String qr="select * from users where id<>?";
		PreparedStatement ps=con.prepareStatement(qr);
		ps.setInt(1,id);
		ResultSet rs=ps.executeQuery();
		ArrayList <BankBean> l= new ArrayList<BankBean>();
	while(rs.next())
	{BankBean b=new BankBean();
			b.setId(rs.getInt(1));
			b.setName(rs.getString(2));
			l.add(b);
	}
		return l;
	}


public BankBean details(int id) throws ClassNotFoundException, SQLException
{
Connection con=getcon();
String qr="select * from users where id=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
BankBean b= new BankBean();
if(rs.next())
{	b.setId(id);
	b.setName(rs.getString(2));
	b.setBalance(rs.getInt(3));
	b.setCity(rs.getString(4));
	b.setBranch(rs.getString(5));
}
return b;
}

public int history(int from,int to,int amount,String date,String time) throws ClassNotFoundException, SQLException
{Connection con=getcon();
	String qr="insert into history values(?,?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(qr);
	 Random rd = new Random();
	ps.setInt(1,Math.abs(rd.nextInt()));
	ps.setInt(2, to);
	ps.setInt(3, from);
	ps.setInt(4, amount);
	ps.setString(5, date);
	ps.setString(6, time);
return ps.executeUpdate();
}

public int update(int amount,int id) throws ClassNotFoundException, SQLException
{
Connection con=getcon();
String qr="update users set balance=? where id=?";
PreparedStatement ps=con.prepareStatement(qr);
ps.setInt(1,amount);
ps.setInt(2, id);
return ps.executeUpdate();

}

}