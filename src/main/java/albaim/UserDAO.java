package albaim;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserDAO implements UserMapper {

  private UserMapper realMapper() {
    SqlSession sqlSession = MyBatisUtil.getSession();
    return sqlSession.getMapper(UserMapper.class);
  }

  @Override
  public List<User> selectAllUsers() {
    return realMapper().selectAllUsers();
  }

  @Override
  public User selectLogin(String id, String passwd_raw) {
    return realMapper().selectLogin(id, passwd_raw);
  }

  @Override
  public void insertUser(User user) {
    realMapper().insertUser(user);
  }

  @Override
  public String selectUsername(String username) {
    return realMapper().selectUsername(username);
  }
}
