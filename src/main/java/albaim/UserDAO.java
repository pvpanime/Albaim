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
//  public int insertUser(User user) {
  public int insertUser(String userid, String email, String passwd_raw, String exprname, int type) {
    SqlSession sqlSession = MyBatisUtil.getSession();
    UserMapper mapper = sqlSession.getMapper(UserMapper.class);
    int result = mapper.insertUser(userid, email, passwd_raw, exprname, type);
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

  @Override
  public int insertEnterprise(String userid, String businessId, String contact) {
    return realMapper().insertEnterprise(userid, businessId, contact);
  }

}
