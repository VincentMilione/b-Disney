package coreModels.beans;

import java.io.Serializable;

public class UserBean implements Serializable {
	
	private static final long serialVersionUID = -1495405198295313698L;
	private String login;
	private String password;

	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
