package facebook_clone.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class User {
    private String user_id;
    private String userName;
    private String email;
    private String password;
    //private String profilePicture;
    private Date birthDate;
    private String gender;
//    private String coverPhoto;

    private String address;
    private String phoneNo;

    public User(String userName, String email, String password, Date birthDate, String gender, String address, String phoneNo) {
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.birthDate = birthDate;
        this.gender = gender;
        this.address = address;
        this.phoneNo = phoneNo;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }
}
