using Dapper;
using demo5webapi.Src.appsettings;
using demo5webapi.Src.CommonInfo;
using Microsoft.Extensions.Options;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            //using (IDbConnection db = new MySql.Data.MySqlClient.MySqlConnection("Server=localhost;Database=brothersam;Port=3306;Uid=root;Pwd=zlsmysql;"))
            //string str = ConfigurationManager.ConnectionStrings["DbConn"].ConnectionString;
            //var defaultcon = Configuration.GetConnectionString("DefaultConnection");
            //var str1 = Options < ConnectionStrings > options;
            //Configuration.GetValue<string>["ConnectionStrings:DbConn"];
            //using (IDbConnection db = new SqlConnection(DbHelper.ConnctionString))
            //using (IDbConnection db = new MySqlConnection("Server=localhost;Database=brothersam;Port=3306;Uid=root;Pwd=zlsmysql;"))
            using (IDbConnection db = new MySqlConnection("Server=localhost;Database=brothersam;Port=3306;Uid=root;Pwd=zlsmysql;"))
            {
                //普通拼接
                //string sql = "SELECT * FROM  BrotherSamUser WHERE UserName='" + userName + "'";
                //用string.Format拼接
                //string sql = string.Format("SELECT * FROM  BrotherSamUser WHERE UserName='{0}'", userName);
                //用用c# 6 语法拼接
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
