package albaim;

import java.time.OffsetDateTime;
import java.util.regex.Pattern;

public class User {
  public static final Pattern EMAIL_PATTERN = Pattern.compile(
    "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$"
  );

  public final String userid;
  public final String email;
  public final String passwd_raw;
  public final String exprname;
  public final int usertype;
  public final OffsetDateTime created_at;

  public User(String userid, String email, String passwdRaw, String exprname, int usertype, OffsetDateTime createdAt) {
    this.userid = userid;
    this.email = email;
    passwd_raw = passwdRaw;
    this.exprname = exprname;
    this.usertype = usertype;
    created_at = createdAt;
  }

  public String getExprname() {
    return exprname;
  }

  public String toString() {
    return String.format("%s <%s> identified by: %s", exprname, email, userid);
  }

}
