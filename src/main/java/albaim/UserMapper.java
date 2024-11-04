package albaim;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

  List<User> selectAllUsers();

  User selectLogin(@Param("userid") String id, @Param("passwd_raw") String passwd_raw);

  int insertUser(User user);

  String selectUserid(@Param("userid") String userid);

  String selectEmail(@Param("email") String email);
}
