package login.model;

import java.sql.Timestamp;

public class User {

	private Long id;
	private String name;
	private String email;
    private String phoneNo;
    private String password;
	private Timestamp createDt;
	private Integer flagLogin;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getCreateDt() {
		return createDt;
	}
	public void setCreateDt(Timestamp createDt) {
		this.createDt = createDt;
	}
	public Integer getFlagLogin() {
		return flagLogin;
	}
	public void setFlagLogin(Integer flagLogin) {
		this.flagLogin = flagLogin;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
