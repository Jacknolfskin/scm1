package cn.zhx.scm1.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class BuyOrderDetail implements Serializable {

	@Override
	public String toString() {
		return "BuyOrderDetail [bodId=" + bodId + ", goodsId=" + goodsId
				+ ", goodsName=" + goodsName + ", goodsUnit=" + goodsUnit
				+ ", goodsType=" + goodsType + ", goodsColor=" + goodsColor
				+ ", bodAmount=" + bodAmount + ", bodBuyPrice=" + bodBuyPrice
				+ ", bodTotalPrice=" + bodTotalPrice + ", boId=" + boId
				+ ", bodImeiList=" + bodImeiList + "]";
	}

	private static final long serialVersionUID = -4001513144832388483L;

	private String bodId;//进货单号

    private String goodsId;//商品号

    private String goodsName;//商品名称

    private String goodsUnit;//商品单位

    private String goodsType;//商品类型

    private String goodsColor;//商品颜色

    private Integer bodAmount;//进货数量

    private BigDecimal bodBuyPrice;//进货价格

    private BigDecimal bodTotalPrice;//进货总价格

    private String boId;//

    private String bodImeiList;//串号列表

    public String getBodId() {
        return bodId;
    }

    public void setBodId(String bodId) {
        this.bodId = bodId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit;
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

    public Integer getBodAmount() {
        return bodAmount;
    }

    public void setBodAmount(Integer bodAmount) {
        this.bodAmount = bodAmount;
    }

    public BigDecimal getBodBuyPrice() {
        return bodBuyPrice;
    }

    public void setBodBuyPrice(BigDecimal bodBuyPrice) {
        this.bodBuyPrice = bodBuyPrice;
    }

    public BigDecimal getBodTotalPrice() {
        return bodTotalPrice;
    }

    public void setBodTotalPrice(BigDecimal bodTotalPrice) {
        this.bodTotalPrice = bodTotalPrice;
    }

    public String getBoId() {
        return boId;
    }

    public void setBoId(String boId) {
        this.boId = boId;
    }

    public String getBodImeiList() {
        return bodImeiList;
    }

    public void setBodImeiList(String bodImeiList) {
        this.bodImeiList = bodImeiList;
    }
}