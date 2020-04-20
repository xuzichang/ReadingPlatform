package valuebean;

import java.io.Serializable;

/**
 * 题头
 */

public class headingInfo implements Serializable {

    public headingInfo() { }

    private String heading_content;
    private String heading_author;

    public String getHeading_author() {
        return heading_author;
    }

    public void setHeading_author(String heading_author) {
        this.heading_author = heading_author;
    }

    public String getHeading_content() {
        return heading_content;
    }

    public void setHeading_content(String heading_content) {
        this.heading_content = heading_content;
    }
}
