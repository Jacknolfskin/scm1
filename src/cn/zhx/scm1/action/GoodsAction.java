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

import cn.zhx.scm1.entity.Account;
import cn.zhx.scm1.entity.Goods;
import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.service.GoodsService;
import cn.zhx.scm1.util.UsePioOutExcel;
@Controller
@RequestMapping("/goods")
public class GoodsAction extends BaseAction {
	@Resource
	private GoodsService goodsService;	
	
	//通过关键字分页查询
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody 
	public Object selectPageUseDyc(Page<Goods> page,Goods goods){
		page.setParamEntity(goods);
		System.out.println("----page:"+page);
		Page p = goodsService.selectPageUseDyc(page);
		//supplier.setSupName("supName1");
		/*Map<String, Object> map =new HashMap<String, Object>();
		map.put("total",p.getTotalRecord());
		map.put("rows",p.getList());*/
		return p.getPageMap();
	}
	
	@RequestMapping(value="/insert")
	@ResponseBody
	public Object insert(Goods goods)
	{
		int i = 0;
		System.out.println("---action.supplier:"+goods);
		try {
			 i = goodsService.insert(goods);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
	
	@RequestMapping(value="/update")
	@ResponseBody
	public Object update(Goods goods)
	{
		int i = 0;
		System.out.println("---action.supplier:"+goods);
		try {
			 i = goodsService.update(goods);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
	
	@RequestMapping("/deleteList")
	@ResponseBody
	public Object deleteList(String [] pks)
	{
		System.out.println("----doAjax.delteList:"+pks);
		int i = 0;
		try {
			i = goodsService.deleteList(pks);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
	// 导出报表
		@RequestMapping("/selectScore")
		@ResponseBody
		public Object selectScore(String [] pks,HttpServletResponse response,HttpServletRequest request) {
			String pksString = request.getParameter("pks");
			System.out.println("pksString="+pksString);

			for (int i = 0; i < pks.length; i++) {
				System.out.println(pks[i]+"------------------------------------");
			}
			List<Map<String, Object>> list = null;
			try {
				list = goodsService.selectScore(pks);
				System.out.println(list.size() + "=====");
				System.out.println("-------------------");
				/*for(GoodsBean db:list){
					System.out.println(db.getGoodsName()+"-----"+db.getGoodsId());
				}*/
				String[] titles = { "商品编号", "商品名称", "单位","型号","颜色" };// 这是excel中要显示的列，就是sql查出的字段列
				List excelList = new ArrayList();
				excelList.add(titles);
				for (int rowId = 0; rowId < list.size(); rowId++) {
					Map order = list.get(rowId);
					String[] rowContents = {
							order.get("goodsId").toString(),
							order.get("goodsName").toString(),
							order.get("goodsUnit").toString(),
							order.get("goodsType").toString(),
							order.get("goodsColor").toString()};
							/*goods.getGoodsId().toString(),
							goods.getGoodsName().toString(),
							goods.getGoodsUnit().toString(),
						    goods.getGoodsType().toString(),
						    goods.getGoodsColor().toString()};*/
					excelList.add(rowContents);
				}
				String excelName = "商品列表"; // 导出的文件名称
				String[] cellFormatType = { "t","t","t","t", "t",};// 这个是有多少列明 就有多少个t
				UsePioOutExcel.writeExcel(excelList, 5,response, excelName,
						excelName + ".xls", cellFormatType); // 调用导出方法 这个3就是代表t的个数
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list.size();
		}
	
	
}
