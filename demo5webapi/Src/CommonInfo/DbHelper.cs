using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Threading.Tasks;

namespace demo5webapi.Src.CommonInfo
{
    /// <summary>
    /// 数据库连接帮助类
    /// </summary>
    public class DbHelper
    {
        /// <summary>
        /// 从配置文件中读取数据库连接字符串
        /// </summary>
        public static string ConnctionString
        {
            //string tre = ConnectionStrings["DbConn"].ConnectionString;
            get { return ConfigurationManager.ConnectionStrings["DbConn"].ConnectionString; }
        }

    }
}

