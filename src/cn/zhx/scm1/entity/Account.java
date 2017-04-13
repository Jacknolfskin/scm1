package cn.zhx.scm1.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Account implements Serializable {
    private Integer accId;

    private String accLogin;

    private String accName;
    
    private String accType;
    
    private String accEmail;
    
    private String validataCode;
    
    private Timestamp registerDate;

    public String getValidataCode() {
		return validataCode;
	}

	public void setValidataCode(String validataCode) {
		this.validataCode = validataCode;
	}

	public Timestamp getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Timestamp registerDate) {
		this.registerDate = registerDate;
	}

	public String getAccEmail() {
		return accEmail;
	}

	public void setAccEmail(String accEmail) {
		this.accEmail = accEmail;
	}

	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	private String accPass;

    public Integer getAccId() {
        return accId;
    }

   

	@Override
	public String toString() {
		return "Account [accId=" + accId + ", accLogin=" + accLogin
				+ ", accName=" + accName + ", accType=" + accType
				+ ", accEmail=" + accEmail + ", validataCode=" + validataCode
				+ ", registerDate=" + registerDate + ", accPass=" + accPass
				+ "]";
	}

	public void setAccId(Integer accId) {
        this.accId = accId;
    }

    public String getAccLogin() {
        return accLogin;
    }

    public void setAccLogin(String accLogin) {
        this.accLogin = accLogin;
    }

    public String getAccName() {
        return accName;
    }

    public void setAccName(String accName) {
        this.accName = accName;
    }

    public String getAccPass() {
        return accPass;
    }

    public void setAccPass(String accPass) {
        this.accPass = accPass;
    }
}