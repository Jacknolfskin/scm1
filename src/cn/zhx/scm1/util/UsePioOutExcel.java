package cn.zhx.scm1.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class UsePioOutExcel {
	
	/**
	 * 导出excel通用类
	 * @param list    要导出的数据
	 * @param columnSize  列数
	 * @param response  response对象
	 * @param sheetName sheet的名字  
	 * @param fileName  文件名
	 * @throws IOException
	 */
	public static void writeExcel (List list,int columnSize,HttpServletResponse response,String sheetName,String fileName,String[] cellFormatType) throws IOException {
		
		HSSFWorkbook wb = new HSSFWorkbook();  
        HSSFSheet sheet = wb.createSheet();     //获取一个sheetnew String( sheetName.getBytes("GBK"),"ISO8859-1")
        wb.setSheetName(0, sheetName);
        HSSFHeader header = sheet.getHeader(); 
        header.setCenter("Center Header"); 
        
        HSSFRow row=null;
        for(int rowId=0;rowId<list.size();rowId++){
        	String[] st=(String[])list.get(rowId);
        	row = sheet.createRow(rowId);    //创建行
        	//System.out.println("进入首工具类");
      	  	for(int columnId=0; columnId < columnSize; columnId++){
      	  		HSSFCell cell = row.createCell((short)columnId);    	//创建格  		
      	  		//cell.setEncoding("UTF-16");			//设置单元格的字符编码格式
      	  		if(cellFormatType==null || cellFormatType.length==0){	//如果cellFormatType数组不为空
      	  			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
      	  			cell.setCellValue(st[columnId]); 
      	  		}else{
      	  			if(!cellFormatType[columnId].equals("t") && rowId!=0){
      	  				cell.setCellType(HSSFCell.CELL_TYPE_NUMERIC);
      	  				//如果数值不为空
	  					if(st[columnId]!=null){
	  					 cell.setCellValue(Double.parseDouble(st[columnId])); 
	  					}else{
	  					 cell.setCellValue(st[columnId]); 
	  					}
      	  			}else{
      	  				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
      	  				cell.setCellValue(st[columnId]); 
      	  			}
      	  		}
      	  	}
        }
        //System.out.println("进入工具类");
        
        /**
         * 弹框，让用户选择保存路径
         */
        response.reset();  
		response.setHeader( "Content-Disposition", "attachment;filename="  + new String( fileName.getBytes("GBK"), "ISO8859-1"));
		//System.out.println("进入弹框");
        wb.write(response.getOutputStream());
        response.getOutputStream().close(); 
        
	}

}
