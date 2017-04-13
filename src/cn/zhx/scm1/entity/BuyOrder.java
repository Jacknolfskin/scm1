package cn.zhx.scm1.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

public class BuyOrder implements Serializable {

	public List<BuyOrderDetail> getBuyOrderDetails() {
		return buyOrderDetails;
	}

	public void setBuyOrderDetails(List<BuyOrderDetail> buyOrderDetails) {
		this.buyOrderDetails = buyOrderDetails;
	}

	private static final long serialVersionUID = -7240532727035120051L;

	private String boId;//进货单号

    private Integer supId;//供货商

    private String shId;//仓库

    private String boDate;//进货日期

    private BigDecimal boPayable;//应付金额

    private BigDecimal boPaid;//实付金额

    private BigDecimal boArrears;//欠款

    private String boOriginal;//经手人

    private String boRemark;//备注

    private String boAttn;//原始单号

    private String boOperator;//操作员
    
    public List<BuyOrderDetail> buyOrderDetails;



	@Override
	public String toString() {
		return "BuyOrder [boId=" + boId + ", supId=" + supId + ", shId=" + shId
				+ ", boDate=" + boDate + ", boPayable=" + boPayable
				+ ", boPaid=" + boPaid + ", boArrears=" + boArrears
				+ ", boOriginal=" + boOriginal + ", boRemark=" + boRemark
				+ ", boAttn=" + boAttn + ", boOperator=" + boOperator
				+ ", buyOrderDetails=" + buyOrderDetails + "]";
	}

	public String getBoId() {
        return boId;
    }

    public void setBoId(String boId) {
        this.boId = boId;
    }

    public Integer getSupId() {
        return supId;
    }

    public void setSupId(Integer supId) {
        this.supId = supId;
    }

    public String getShId() {
        return shId;
    }

    public void setShId(String shId) {
        this.shId = shId;
    }

    public String getBoDate() {
        return boDate;
    }

    public void setBoDate(String boDate) {
        this.boDate = boDate;
    }

    public BigDecimal getBoPayable() {
        return boPayable;
    }

    public void setBoPayable(BigDecimal boPayable) {
        this.boPayable = boPayable;
    }

    public BigDecimal getBoPaid() {
        return boPaid;
    }

    public void setBoPaid(BigDecimal boPaid) {
        this.boPaid = boPaid;
    }

    public BigDecimal getBoArrears() {
        return boArrears;
    }

    public void setBoArrears(BigDecimal boArrears) {
        this.boArrears = boArrears;
    }

    public String getBoOriginal() {
        return boOriginal;
    }

    public void setBoOriginal(String boOriginal) {
        this.boOriginal = boOriginal;
    }

    public String getBoRemark() {
        return boRemark;
    }

    public void setBoRemark(String boRemark) {
        this.boRemark = boRemark;
    }

    public String getBoAttn() {
        return boAttn;
    }

    public void setBoAttn(String boAttn) {
        this.boAttn = boAttn;
    }

    public String getBoOperator() {
        return boOperator;
    }

    public void setBoOperator(String boOperator) {
        this.boOperator = boOperator;
    }
}