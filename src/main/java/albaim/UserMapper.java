package albaim;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

  List<User> selectAllUsers();

  User selectLogin(@Param("userid") String id, @Param("passwd_raw") String passwd_raw);

//  int insertUser(User user);
  int insertUser(@Param("userid") String USERID, @Param("email") String EMAIL, @Param("passwd_raw") String PASSWD_RAW, @Param("exprname") String EXPRNAME, @Param("usertype") int USERTYPE);

  String selectUserid(@Param("userid") String userid);

  String selectEmail(@Param("email") String email);

  int insertEnterprise(@Param("userid") String userid, @Param("businessId") String businessId, @Param("contact") String contact);
}
