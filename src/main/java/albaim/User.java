package albaim;

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

  public User(String userid, String email, String passwdRaw, String exprname, int usertype

  ) {
    this.userid = userid;
    this.email = email;
    passwd_raw = passwdRaw;
    this.exprname = exprname;
    this.usertype = usertype;
  }

  public String getUserid() {
    return userid;
  }

  public String getEmail() {
    return email;
  }

  public String getPasswd_raw() {
    return passwd_raw;
  }

  public String getExprname() {
    return exprname;
  }

  public int getUsertype() {
    return usertype;
  }

  public String toString() {
    return String.format("%s <%s> identified by: %s", exprname, email, userid);
  }

}
