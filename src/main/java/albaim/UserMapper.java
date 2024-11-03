package albaim;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

  List<User> selectAllUsers();

  User selectLogin(@Param("username") String id, @Param("passwd_raw") String passwd_raw);

  void insertUser(User user);

  String selectUsername(@Param("username") String username);
}
