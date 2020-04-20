package valuebean;

import java.io.Serializable;

/**
 * 用户信息
 */

public class userInfo implements Serializable {

    public userInfo() {
        super();
    }

    private String user_id;
    private String user_name;
    private String collection_id;
    private String following_id;
    private String one_line_describe;

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getCollection_id() {
        return collection_id;
    }

    public void setCollection_id(String collection_id) {
        this.collection_id = collection_id;
    }

    public String getFollowing_id() {
        return following_id;
    }

    public void setFollowing_id(String following_id) {
        this.following_id = following_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getOne_line_describe() {
        return one_line_describe;
    }

    public void setOne_line_describe(String one_line_describe) {
        this.one_line_describe = one_line_describe;
    }
}
