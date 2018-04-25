package com.bankfyle.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bankfyle.bean.bank;

public class CRUD {

	static Connection cn=null;
	static PreparedStatement ps=null;
	static ResultSet rs=null;
	
	public static String[]  getBank()//returns all the banks name
	{
		List<String> data=new ArrayList<String>();
		cn=DbConnection.getConnection();
		try {
			ps=cn.prepareStatement("select distinct bank_name from bank_details order by 1 asc");
			rs=ps.executeQuery();
			while(rs.next())
			{
				data.add(rs.getString(1));
			}
			
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String[] bank = new String[data.size()];
		bank = data.toArray(bank);
		return bank;
	}
	
	public static bank[] getBankBranch(String city,String bank)// Retrieves all the branches of a bank in specific city 
	{
		List<bank> data=new ArrayList<bank>();
		cn=DbConnection.getConnection();
		try {
			ps=cn.prepareStatement("select bank_branch,bank_ifsc from bank_details where bank_city=? and bank_name=?");
			ps.setString(1, city);
			ps.setString(2, bank);
			rs=ps.executeQuery();
			while(rs.next())
			{
				bank ob=new bank();
				ob.setBranch(rs.getString(1));
				ob.setIfsc(rs.getString(2));
				data.add(ob);
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		bank[] bnk = new bank[data.size()];
		bnk = data.toArray(bnk);
		return bnk;
	}
	public static bank getBankDetails(String ifsc)// Retrieves bank details 
	{
		bank ob=new bank();
		cn=DbConnection.getConnection();
		try {
			ps=cn.prepareStatement("select * from bank_details where bank_ifsc=?");
			ps.setString(1, ifsc);
			rs=ps.executeQuery();
			if(rs.next())
			{
				ob.setName(rs.getString("bank_name"));
				ob.setIfsc(rs.getString("bank_ifsc"));
				ob.setBranch(rs.getString("bank_branch"));
				ob.setAddress(rs.getString("bank_address"));
				ob.setCity(rs.getString("bank_city"));
				ob.setDistrict(rs.getString("bank_district"));
				ob.setState(rs.getString("bank_state"));
			}
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ob;
	}
}
