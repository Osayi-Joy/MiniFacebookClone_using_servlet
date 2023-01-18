package facebook_clone.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Posts {
    private String user_id;
    private String textPost;
    private Date dateOfPost;
    private String post_id;
    private String post_title;

    public Posts(String user_id, String textPost, String post_title) {
        this.user_id = user_id;
        this.textPost = textPost;
        this.post_title = post_title;
    }

    public Posts(String user_id, String post_id) {
        this.user_id = user_id;
        this.post_id = post_id;
    }
}
