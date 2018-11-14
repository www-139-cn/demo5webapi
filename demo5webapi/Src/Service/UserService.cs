using Dapper;
using demo5webapi.Src.CommonInfo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace demo5webapi.Src.Service
{
    /// <summary>
    /// 用户信息服务类
    /// </summary>
    public class UserService
    {
        /// <summary>
        /// 根据姓名查询用户资料集合
        /// </summary>
        /// <param name="userName">姓名</param>
        /// <returns></returns>
        public List<BrotherSamUser> FindListByUserName(string userName)
        {
            //SELECT * FROM  BrotherSamUser WHERE UserName='userName'
            //这里用using 语句块，当运行完了，会自动释放db连接资源。不用using就需要手动释放db资源
            using (IDbConnection db=new SqlConnection(DbHelper.ConnctionString))
            {
                //string sql = "SELECT * FROM  BrotherSamUser WHERE UserName='" + userName + "'";
                //string sql = string.Format("SELECT * FROM  BrotherSamUser WHERE UserName='{0}'", userName);
                string sql = $"SELECT * FROM  BrotherSamUser WHERE UserName='{userName}'";
                // db.Query 是 Dapper 实现的查询扩展；
                //<BrotherSamUser>表示转换成这个约束格式
                //IEnumerable 是因为 db.Query返回的是IEnumerable 集合
                IEnumerable<BrotherSamUser> list = db.Query<BrotherSamUser>(sql);
                return list.ToList();
            }
        }
    }
}
