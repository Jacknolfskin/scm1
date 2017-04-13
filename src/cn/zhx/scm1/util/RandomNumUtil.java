package cn.zhx.scm1.util;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;

public class RandomNumUtil {
	
	public static final char[] CHARS = {'0','1','2', '3', '4', '5', '6', '7', '8',  
        '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M',  
        'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	
	private ByteArrayInputStream image;//图像
	
	private String str;//验证码
	
	//构造函数
	private RandomNumUtil(){
		init(); //初始化属性
	}
	
	/**
	 * 获得RandomNumUtil实例
	*/
	public static RandomNumUtil Instance() {
		return new RandomNumUtil();
	}

	/**
	 * 获得图片验证图片
	 */
	public ByteArrayInputStream getImage() {
		return image;
	}

	public void setImage(ByteArrayInputStream image) {
		this.image = image;
	}

	/**
	 * 获得图片验证码
	 * @return
	 */
	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}
	
	/**
	 * 初始化
	 */
	private void init() {
		//在内存中创建图像
		int width=65,height=20;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//获取图形上下文
		Graphics g = image.getGraphics();
		//生产随机类
		Random random = new Random();
		//设定背景色
		g.setColor(getRandColor(200,250));
		g.fillRect(0, 0, width, height);
		//设定字体
		g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
		//随机产生155条干扰线，使图像中的认证码不易被其它程序探测到 
		 g.setColor(getRandColor(160, 200));  
	        for (int i = 0; i < 155; i++) {  
	            int x = random.nextInt(width);  
	            int y = random.nextInt(height);  
	            int xl = random.nextInt(12);  
	            int yl = random.nextInt(12);  
	            g.drawLine(x, y, x + xl, y + yl);  
	        }  
	        //取随机产生的认证码（6位数字） 
	        StringBuffer sRand = new StringBuffer();    
	        for (int i = 0; i < 4; i++) {  
	            String rand = String.valueOf(CHARS[random.nextInt(CHARS.length)]);  
	            sRand.append(rand);  
	               
	            //将认证码显示到图像中  
	            g.setColor(new Color(20 + random.nextInt(110), 20 + random  
	                    .nextInt(110), 20 + random.nextInt(110)));  
	            //调用函数出来的颜色相同，可能是因为种子太接近，所以直接生成
	            g.drawString(rand, 13 * i + 6, 16);  
	        }  
	        //赋值验证码 
	        this.str = sRand.toString();  
	        
	        //图像生效 
	        g.dispose();  
	        ByteArrayInputStream input = null;  
	        ByteArrayOutputStream output = new ByteArrayOutputStream();  
	        try {  
	            ImageOutputStream imageOut = ImageIO  
	                    .createImageOutputStream(output);  
	            ImageIO.write(image, "JPEG", imageOut);  
	            imageOut.close();  
	            input = new ByteArrayInputStream(output.toByteArray());  
	        } catch (Exception e) {  
	            System.out.println("验证码图片产生出现错误" + e.toString());  
	        }  
	 
	        this.image = input;/*赋值图像 */ 
	}
	
	/*  
     * 给定范围获得随机颜色 
     */ 
    private Color getRandColor(int fc, int bc) {  
        Random random = new Random();  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }  
	
}
