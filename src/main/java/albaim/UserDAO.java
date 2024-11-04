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
  public int insertUser(User user) {
    System.out.println(user);
    SqlSession sqlSession = MyBatisUtil.getSession();
    UserMapper mapper = sqlSession.getMapper(UserMapper.class);
    int result = mapper.insertUser(user);
    System.out.println(result);
    sqlSession.commit();
    return result;
  }

  @Override
  public String selectUserid(String userid) {
    return realMapper().selectUserid(userid);
  }

  @Override
  public String selectEmail(String email) { return realMapper().selectEmail(email); }
}
