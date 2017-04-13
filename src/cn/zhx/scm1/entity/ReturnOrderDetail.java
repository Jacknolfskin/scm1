package cn.zhx.scm1.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class ReturnOrderDetail implements Serializable {
    @Override
	public String toString() {
		return "ReturnOrderDetail [rodId=" + rodId + ", goodsId=" + goodsId
				+ ", goodsUnit=" + goodsUnit + ", goodsName=" + goodsName
				+ ", goodsType=" + goodsType + ", goodsColor=" + goodsColor
				+ ", rodAmount=" + rodAmount + ", rodReturnPrice="
				+ rodReturnPrice + ", rodTotalPrice=" + rodTotalPrice
				+ ", roId=" + roId + ", rodImeiList=" + rodImeiList + "]";
	}

	private String rodId;//退货单号

    private String goodsId;//商品号

    private String goodsUnit;//商品名称

    private String goodsName;//商品单位

    private String goodsType;//商品类型

    private String goodsColor;//商品颜色

    private Integer rodAmount;//退货数量

    private BigDecimal rodReturnPrice;//退货价格

    private BigDecimal rodTotalPrice;//退货总价格

    private String roId;

    private String rodImeiList;//串号列表

    public String getRodId() {
        return rodId;
    }

    public void setRodId(String rodId) {
        this.rodId = rodId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getGoodsColor() {
        return goodsColor;
    }

    public void setGoodsColor(String goodsColor) {
        this.goodsColor = goodsColor;
    }

    public Integer getRodAmount() {
        return rodAmount;
    }

    public void setRodAmount(Integer rodAmount) {
        this.rodAmount = rodAmount;
    }

    public BigDecimal getRodReturnPrice() {
        return rodReturnPrice;
    }

    public void setRodReturnPrice(BigDecimal rodReturnPrice) {
        this.rodReturnPrice = rodReturnPrice;
    }

    public BigDecimal getRodTotalPrice() {
        return rodTotalPrice;
    }

    public void setRodTotalPrice(BigDecimal rodTotalPrice) {
        this.rodTotalPrice = rodTotalPrice;
    }

    public String getRoId() {
        return roId;
    }

    public void setRoId(String roId) {
        this.roId = roId;
    }

    public String getRodImeiList() {
        return rodImeiList;
    }

    public void setRodImeiList(String rodImeiList) {
        this.rodImeiList = rodImeiList;
    }
}