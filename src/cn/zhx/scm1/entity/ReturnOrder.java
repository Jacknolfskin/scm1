package cn.zhx.scm1.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class ReturnOrder implements Serializable{
    @Override
	public String toString() {
		return "ReturnOrder [roId=" + roId + ", supId=" + supId + ", shId="
				+ shId + ", roDate=" + roDate + ", roPayable=" + roPayable
				+ ", roPaid=" + roPaid + ", roRemark=" + roRemark + ", roAttn="
				+ roAttn + ", roOperator=" + roOperator +",roOriginal="+roOriginal+",roArrears="+roArrears+ "]";
	}

	private String roId;//退货单号

    private Integer supId;//供货商

    private String shId;//仓库

    private String roDate;//退货日期

	private BigDecimal roPayable;//应退金额

    private BigDecimal roPaid;//实退金额
    
    private BigDecimal roArrears;//欠款

    private String roRemark;//备注
    
    private String roOriginal;//经手人

	private String roAttn;//原始单号

	private String roOperator;//操作员
    
    public List<ReturnOrderDetail> returnOrderDetails;

	public String getRoId() {
		return roId;
	}

	public void setRoId(String roId) {
		this.roId = roId;
	}
	
	public String getRoDate() {
		return roDate;
	}

	public void setRoDate(String roDate) {
		this.roDate = roDate;
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

	public BigDecimal getRoPayable() {
		return roPayable;
	}

	public void setRoPayable(BigDecimal roPayable) {
		this.roPayable = roPayable;
	}

	public BigDecimal getRoPaid() {
		return roPaid;
	}

	public void setRoPaid(BigDecimal roPaid) {
		this.roPaid = roPaid;
	}

	public BigDecimal getRoArrears() {
		return roArrears;
	}

	public void setRoArrears(BigDecimal roArrears) {
		this.roArrears = roArrears;
	}

	public String getRoRemark() {
		return roRemark;
	}

	public void setRoRemark(String roRemark) {
		this.roRemark = roRemark;
	}

	public String getRoOriginal() {
		return roOriginal;
	}

	public void setRoOriginal(String roOriginal) {
		this.roOriginal = roOriginal;
	}

	public String getRoAttn() {
		return roAttn;
	}

	public void setRoAttn(String roAttn) {
		this.roAttn = roAttn;
	}

	public String getRoOperator() {
		return roOperator;
	}

	public void setRoOperator(String roOperator) {
		this.roOperator = roOperator;
	}

	public List<ReturnOrderDetail> getReturnOrderDetails() {
		return returnOrderDetails;
	}

	public void setReturnOrderDetails(List<ReturnOrderDetail> returnOrderDetails) {
		this.returnOrderDetails = returnOrderDetails;
	}

    
}