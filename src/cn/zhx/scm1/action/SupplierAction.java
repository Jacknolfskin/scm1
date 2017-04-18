package cn.zhx.scm1.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.entity.Supplier;
import cn.zhx.scm1.service.SupplierService;
import cn.zhx.scm1.util.UsePioOutExcel;

/**
 * @author:胡飞
 * @date:2017-1-3 下午4:03:05
 *
 * 
 */
@Controller
@RequestMapping("/supplier")
public class SupplierAction extends BaseAction{
@Resource
private SupplierService supplierService;
//Account account = (Account) session.getAttribute("account");


@RequestMapping("/selectSupplier")
@ResponseBody
public Object selectSupplier(String start,String end){
	System.out.println("start:"+ start+"||end:"+end);
	Map<String, String> paramMap =new HashMap<String, String>();
	paramMap.put("start", start);
	paramMap.put("end", end);
	return supplierService.selectSupplier(paramMap);
}


@RequestMapping(value="/insert")
@ResponseBody
public Object insert(Supplier supplier)
{
	int i = 0;
	System.out.println("---action.supplier:"+supplier);
	try {
		 i = supplierService.insert(supplier);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return i;
}

//根据主键修改供应商的信息
@RequestMapping(value="/update")
@ResponseBody
public Object update(Supplier supplier){
	System.out.println("----action.update.supplier:"+supplier);
	int i = 0;
	try {
		i = supplierService.update(supplier);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return i;
}
//批量删除供应商
@RequestMapping("/deleteList")
@ResponseBody
public Object deleteList(String [] pks)
{
	System.out.println("----doAjax.delteList:"+pks);
	int i = 0;
	try {
		i = supplierService.deleteList(pks);
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return i;
}

@RequestMapping("/selectPage")
@ResponseBody
public Object selectPage(Page<Supplier> page){
	Page p = supplierService.selectPage(page);
	System.out.println("----page"+page);
	return page.getPageMap();
}

@RequestMapping ("/selectPageUseDyc")
@ResponseBody
public Object selectPageUseDyc(Page<Supplier> page,Supplier supplier){
	page.setParamEntity(supplier);
	Page p = supplierService.selectPageUseDyc(page);
	System.out.println("----page"+page);
	return p.getPageMap();
}



//导出报表
		@RequestMapping("/selectScore")
		@ResponseBody
		public Object selectScore(String [] pks,HttpServletResponse response,HttpServletRequest request) {
			
			String pksString = request.getParameter("pks");
			List<Map<String, Object>> list = null;
			try {
				list = supplierService.selectScore(pks);
				String[] titles = { "供应商编号", "供应商名称","联系人", "联系电话","期初应付(元)","供应商类型","供应商地址","备注" };// 这是excel中要显示的列，就是sql查出的字段列
				List excelList = new ArrayList();
				excelList.add(titles);
				for (int rowId = 0; rowId < list.size(); rowId++) {
					Map order = list.get(rowId);
					String[] rowContents = {
							order.get("supId").toString(),
							order.get("supName").toString(),
							order.get("supLinkman").toString(),
							order.get("supPhone").toString(),
							order.get("supPay").toString(),
							order.get("supType").toString(),
							order.get("supAddress").toString(),
							order.get("supRemark").toString()};
					excelList.add(rowContents);
				}
				String excelName = "供应商列表"; // 导出的文件名称
				String[] cellFormatType = { "t","t","t","t", "t","t", "t","t",};// 这个是有多少列明 就有多少个t
				UsePioOutExcel.writeExcel(excelList, 8,response, excelName,
						excelName + ".xls", cellFormatType); // 调用导出方法 这个3就是代表t的个数
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list.size();
		}
	

@RequestMapping("/doAjax")
@ResponseBody
public Object doAjax(Supplier supplier){
	System.out.println("---doAjax.supplier:"+supplier);
	supplier.setSupName("supName1");
	return supplier;
}
}
