package albaim;

import java.time.OffsetDateTime;

public class User {
  private final String username;
  private final String email;
  private final String passwd_raw;
  private final String exprname;
  private final int usertype;
  private final OffsetDateTime created_at;

  public User(String username, String email, String passwdRaw, String exprname, int usertype, OffsetDateTime createdAt) {
    this.username = username;
    this.email = email;
    passwd_raw = passwdRaw;
    this.exprname = exprname;
    this.usertype = usertype;
    created_at = createdAt;
  }

  public String getUsername() {
    return username;
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

  public OffsetDateTime getCreated_at() {
    return created_at;
  }
}
