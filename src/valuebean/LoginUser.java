package valuebean;

/**
 * 登录用户
 */

public class LoginUser {

    private String userId; //用户ID
    private String userName; //用户姓名
    private String password; //用户姓名

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName()
    {
        return userName;
    }

    public void setUserName(String userName)
    {
        this.userName = userName;
    }
}
