package cn.zhx.scm1.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.zhx.scm1.entity.AccountRecords;
import cn.zhx.scm1.entity.Page;
import cn.zhx.scm1.service.AccountRecordsService;
import cn.zhx.scm1.util.UsePioOutExcel;

@Controller
@RequestMapping("/accountRecords")
public class AccountRecordsAction extends BaseAction{
	@Resource
private AccountRecordsService accountRecordsService;
	//进销明细分页显示
	@RequestMapping("/selectPageUseDyc")
	@ResponseBody
	public Object selectPageUseDyc(Page<AccountRecords> page,AccountRecords accountRecords)
	{
		page.setParamEntity(accountRecords);
		Page p = accountRecordsService.selectPageUseDyc(page);
		
		//System.out.println("^^^^^^^^^^^^"+p.getPageMap());
		//System.out.println("%%%%%%%%%%%%"+(p.getPageMap().get("rows")));
		
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String dateString = sdf.format((p.getPageMap().get("arDate")));
		p.getPageMap().put("arDate", dateString);*/
		
		//String date = sd.format(now);
		//System.out.println("----------boDate:"+dateString);
		System.out.println("--------Action.accountRecords--page:"+page);
		//System.out.println("========arDate:"+p.getPageMap().get("arDate"));
		return p.getPageMap();
	}
	
	//进销明细修改
	@RequestMapping("/update")
	@ResponseBody
	public Object update(AccountRecords accountRecords){
		int i = 0;
		System.out.println("----Action.accountRecords:"+accountRecords);
		try {
			
			i = accountRecordsService.update(accountRecords);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return i;
		
	}
	
	//批量删除
	@RequestMapping("/deleteList")
	@ResponseBody
	public Object deleteList(String [] pks){
		System.out.println("---------------------------------------");
		System.out.println("----action.deleteList"+pks);
		int i = 0;
		try {
			i = accountRecordsService.deleteList(pks);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return i;
	}
	
    //批量导出
	@RequestMapping("/selectScore")
	@ResponseBody
	public Object selectScore(String [] pks,HttpServletRequest request,HttpServletResponse response){
		
		String pksString = request.getParameter("pks");
		System.out.println("pksString="+pksString);

		for (int i = 0; i < pks.length; i++) {
			System.out.println(pks[i]+"------------------------------------");
		}
		
		List<Map<String, Object>> list = null;
		try {
			list = accountRecordsService.selectScore(pks);
			String [] title = {"供应商编号","交易类型","应付","已付","欠款","优惠金额","原始单号","操作员","交易时间","备注","交易编号"};
			List excelList  = new ArrayList();
			excelList.add(title);
			Map orderMap = null;
			for (int rowId = 0; rowId < list.size(); rowId++) {
				orderMap = list.get(rowId);
				String [] rowContents={
						orderMap.get("supId").toString(),
						orderMap.get("arBusType").toString(),
						orderMap.get("arPayable").toString(),
						orderMap.get("arPaid").toString(),
						orderMap.get("arArrears").toString(),
						orderMap.get("arDiscount").toString(),
						orderMap.get("arAttn").toString(),
						orderMap.get("arOperator").toString(),
						orderMap.get("arDate").toString(),
						orderMap.get("arRemark").toString(),
						orderMap.get("arId").toString()					
				};
				excelList.add(rowContents);	
			}
			String excelName = "进销明细";
			String [] cellFormatType = {"t","t","t","t","t","t","t","t","t","t","t",};
			UsePioOutExcel.writeExcel(excelList, 11,response, excelName,
					excelName + ".xls", cellFormatType); // 调用导出方法 这个3就是代表t的个数
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list.size();
		
	}

}
