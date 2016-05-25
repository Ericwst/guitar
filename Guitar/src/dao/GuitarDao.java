package dao;

import java.sql.*;
import java.util.*;

import domain.GuitarForm;
import tool.JDBConnection;

//对管理员的操作
/**
 * @tag pattern id = "9e21c733-71ca-4e18-8e83-284989e17ac3" schema =
 *      "3152aeca-eb66-432c-ac56-9b752e86de97" role = "Product" comment = ""
 */
public class GuitarDao {
	private Connection connection = null; // 定义连接的对象
	private PreparedStatement ps = null; // 定义预准备的对象
	private JDBConnection jdbc = null; // 定义数据库连接对象

	public GuitarDao() {
		jdbc = new JDBConnection();
		connection = jdbc.connection; // 利用构造方法取得数据库连接
	}

	// 查询全部吉他的信息
	public List<GuitarForm> selectGuitar() {
		List<GuitarForm> list = new ArrayList<GuitarForm>();
		GuitarForm guitar = null;
		try {
			ps = connection.prepareStatement("select * from guitar");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				guitar = new GuitarForm();
				guitar.setSerialNumber(rs.getString(1));
				guitar.setPrice(rs.getInt(2));
				guitar.setBuilder(rs.getString(3));
				guitar.setModel(rs.getString(4));
				guitar.setType(rs.getString(5));
				guitar.setTopWood(rs.getString(6));
				guitar.setBackWood(rs.getString(7));
				list.add(guitar);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	// 条件查询吉他的信息
	public List<GuitarForm> selectGuitar(GuitarForm form) {
		List<GuitarForm> list = new ArrayList<GuitarForm>();
		GuitarForm guitar = null;
		String sql = "select * from guitar where 1=1";
		if (form.getSerialNumber() != null && !form.getSerialNumber().equals("")) {
		    sql = sql + "  and serialNumber='" + form.getSerialNumber() + "'";// 
		}
		if (form.getPrice() != 0.0 && String.valueOf(form.getPrice()) != "") {
		    sql = sql + "  and price=" + "'" + form.getPrice() + "'";  // 
		}
		if (form.getBuilder() != null && !form.getBuilder().equals("")) {
		    sql = sql + "  and builder='" + form.getBuilder() + "'";// 
		}
		if (form.getModel() != null && !form.getModel().equals("")) {
			sql = sql + "  and model='" + form.getModel() + "'";// 
		}
		if (form.getType() != null && !form.getType().equals("")) {
			sql = sql + "  and type='" + form.getType() + "'";// 
		}
		if (form.getTopWood() != null && !form.getTopWood().equals("")) {
			sql = sql + "  and topwood='" + form.getTopWood() + "'";// 
		}
		if (form.getBackWood() != null && !form.getBackWood().equals("")) {
			sql = sql + "  and backwood='" + form.getBackWood() + "'";// 
		}
		try {
			ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				guitar = new GuitarForm();
				guitar.setSerialNumber(rs.getString(1));
				guitar.setPrice(rs.getDouble(2));
				guitar.setBuilder(rs.getString(3));
				guitar.setModel(rs.getString(4));
				guitar.setType(rs.getString(5));
				guitar.setTopWood(rs.getString(6));
				guitar.setBackWood(rs.getString(7));
				list.add(guitar);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}

	//以编号为条件查询信息
	  public GuitarForm selectSerialNumber(String serialNumber) {
	    GuitarForm guitar = null;
	    try {
	      ps = connection.prepareStatement("select * from guitar where serialNumber=?");
	      ps.setString(1, serialNumber);
	      ResultSet rs = ps.executeQuery();
	      while (rs.next()) {
	        guitar = new GuitarForm();
			guitar.setSerialNumber(rs.getString(1));
	      }
	    }
	    catch (SQLException ex) {
	    	ex.printStackTrace();
	    }
	    return guitar;
	  }

	// 添加吉他信息
	public boolean insertGuitar(GuitarForm form) {
		try {
			ps = connection.prepareStatement("insert into guitar values(?,?,?,?,?,?,?)");
			ps.setString(1, form.getSerialNumber());
			ps.setDouble(2, form.getPrice());
			ps.setString(3, form.getBuilder());
			ps.setString(4, form.getModel());
			ps.setString(5, form.getType());
			ps.setString(6, form.getTopWood());
			ps.setString(7, form.getBackWood());
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	// 以编号ID进行删除的操作
	public boolean deleteGuitar(String serialNumber) {
		try {
			ps = connection.prepareStatement("delete from guitar where serialNumber=?");
			ps.setString(1, serialNumber);
			ps.executeUpdate();
			ps.close();
			return true;
		} catch (SQLException ex) {
			ex.printStackTrace();
			return false;
		}
	}


}
