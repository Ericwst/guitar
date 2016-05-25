package webtier;

import org.apache.struts.action.*;
import javax.servlet.http.*;

import dao.GuitarDao;
import domain.GuitarForm;

import java.util.*;

//后台管理员的Action
/**
 * @tag pattern id = "9e21c733-71ca-4e18-8e83-284989e17ac3" schema =
 *      "3152aeca-eb66-432c-ac56-9b752e86de97" role = "Builder" comment = ""
 */
public class GuitarAction extends Action {
	private GuitarDao dao = null;
	private int action;

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {

		dao = new GuitarDao();
		action = Integer.parseInt(request.getParameter("action"));
		switch (action) {
		case 1: {
			return guitarSelect(mapping, form, request, response); // 查询所有
		}
		case 2: {
			return guitarInsert(mapping, form, request, response); // 添加
		}
		case 3: {
			return guitarDelete(mapping, form, request, response); // 删除
		}
		/*
		 * case 4: { return guitarSelectOne(mapping, form, request, response);
		 * // 条件查询 }
		 */

		}
		throw new java.lang.UnsupportedOperationException("Method $execute() not yet implemented.");
	}

	/*
	 * // 0 判断管理员登录后台 public ActionForward inventoryCheck(ActionMapping mapping,
	 * ActionForm form, HttpServletRequest request, HttpServletResponse
	 * response) { String adminName = request.getParameter("adminName");
	 * AdminForm adminForm = dao.selectAdminName(adminName); if (adminForm ==
	 * null) { request.setAttribute("result", "您输入的账号不存在！"); } else if
	 * (!adminForm.getAdminPassword().equals(
	 * request.getParameter("adminPassword"))) { request.setAttribute("result",
	 * "您输入的密码不存在！"); } else { request.setAttribute("admin", adminForm); }
	 * return mapping.findForward("checkAdminResult"); }
	 */

	// 1条件查询所有吉他信息
	public ActionForward guitarSelect(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		GuitarForm GuitarForm = (GuitarForm) form;
/*		String serialNumber = request.getParameter("serialNumber").toLowerCase();
		Double price = Double.valueOf(request.getParameter("price"));
		String builder = request.getParameter("builder").toLowerCase();
		String model = request.getParameter("model").toLowerCase();
		String type = request.getParameter("type").toLowerCase();
		String TopWood = request.getParameter("topWood").toLowerCase();
		String BackWood = request.getParameter("backWood").toLowerCase();*/

/*		if (serialNumber != null) {
			GuitarForm.setSerialNumber(serialNumber);
		}
		if (price != null) {
			GuitarForm.setPrice(price);
		}
		if (builder != null) {
			GuitarForm.setBuilder(builder);
		}
		if (model != null) {
			GuitarForm.setModel(model);
		}
		if (type != null) {
			GuitarForm.setType(type);
		}
		if (TopWood != null) {
			GuitarForm.setTopWood(TopWood);
		}
		if (BackWood != null) {
			GuitarForm.setBackWood(BackWood);
		}*/
		List<GuitarForm> list = dao.selectGuitar(GuitarForm);
		int pageNumber = list.size(); // 计算出有多少条记录
		int maxPage = pageNumber; // 计算有多少页数
		String number = request.getParameter("i");
		if (maxPage % 14 == 0) {
			maxPage = maxPage / 14;
		} else {
			maxPage = maxPage / 14 + 1;
		}
		if (number == null) {
			number = "0";
		}
		request.setAttribute("number", String.valueOf(number));
		request.setAttribute("maxPage", String.valueOf(maxPage));
		request.setAttribute("pageNumber", String.valueOf(pageNumber));

		request.setAttribute("list", list);
		return mapping.findForward("guitarSelect");
	}

	// 2添加吉他信息
	public ActionForward guitarInsert(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		GuitarForm guitarForm = (GuitarForm) form;

		GuitarForm guitar = dao.selectSerialNumber(guitarForm.getSerialNumber());
		if (guitar == null || guitar.equals("")) {
			dao.insertGuitar(guitarForm);
			return guitarSelect(mapping, form, request, response);
		} else {
			request.setAttribute("result", "此吉他信息已经存在！！");
			return mapping.findForward("guitarInsert");
		}
	}

	// 3删除吉他信息
	public ActionForward guitarDelete(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) {
		dao.deleteGuitar(request.getParameter("serialNumber"));
		request.setAttribute("result", "删除此吉他信息成功！");
		return guitarSelect(mapping, form, request, response);
	}

	/*
	 * // 4条件查询吉他信息 public ActionForward guitarSelectOne(ActionMapping mapping,
	 * ActionForm form, HttpServletRequest request, HttpServletResponse
	 * response) { GuitarForm GuitarForm = (GuitarForm) form;
	 * GuitarForm.setSerialNumber(request.getParameter("serialNumber").
	 * toLowerCase());
	 * GuitarForm.setPrice(Integer.valueOf(request.getParameter("price")));
	 * GuitarForm.setBuilder(request.getParameter("builder").toLowerCase());
	 * GuitarForm.setModel(request.getParameter("model").toLowerCase());
	 * GuitarForm.setType(request.getParameter("type").toLowerCase());
	 * GuitarForm.setTopWood(request.getParameter("topWood").toLowerCase());
	 * GuitarForm.setBackWood(request.getParameter("backWood").toLowerCase());
	 * List<GuitarForm> list = dao.selectGuitar(GuitarForm); int pageNumber =
	 * list.size(); // 计算出有多少条记录 int maxPage = pageNumber; // 计算有多少页数 String
	 * number = request.getParameter("i"); if (maxPage % 14 == 0) { maxPage =
	 * maxPage / 14; } else { maxPage = maxPage / 14 + 1; } if (number == null)
	 * { number = "0"; } request.setAttribute("number", String.valueOf(number));
	 * request.setAttribute("maxPage", String.valueOf(maxPage));
	 * request.setAttribute("pageNumber", String.valueOf(pageNumber));
	 * 
	 * request.setAttribute("list", list); return
	 * mapping.findForward("guitarSelectOne"); }
	 */
}
