package valuebean;

import java.io.Serializable;

/**
 * 主题帖
 */

public class themeInfo implements Serializable {

    public themeInfo() { }

    private String theme_id;
    private String author_id;
    private String theme_name;
    private String theme_content;
    private String author_name;
    private String update_time;
    private String one_line_describe;

    public String getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(String author_id) {
        this.author_id = author_id;
    }

    public String getOne_line_describe() {
        return one_line_describe;
    }

    public void setOne_line_describe(String one_line_describe) {
        this.one_line_describe = one_line_describe;
    }

    public String getTheme_content() {
        return theme_content;
    }

    public void setTheme_content(String theme_content) {
        this.theme_content = theme_content;
    }

    public String getTheme_id() {
        return theme_id;
    }

    public void setTheme_id(String theme_id) {
        this.theme_id = theme_id;
    }

    public String getTheme_name() {
        return theme_name;
    }

    public void setTheme_name(String theme_name) {
        this.theme_name = theme_name;
    }

    public String getAuthor_name() {
        return author_name;
    }

    public void setAuthor_name(String author_name) {
        this.author_name = author_name;
    }

    public String getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(String update_time) {
        this.update_time = update_time;
    }


}
