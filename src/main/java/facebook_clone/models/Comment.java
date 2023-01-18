package facebook_clone.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@NoArgsConstructor
@Setter
@AllArgsConstructor
public class Comment {
    private String comment_id;
    private String user_id;
    private String post_id;
    private String comment;
    private String dateAndTime;
}
