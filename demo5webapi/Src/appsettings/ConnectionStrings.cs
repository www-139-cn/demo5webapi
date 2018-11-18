using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace demo5webapi.Src.appsettings
{
    /// <summary>
    /// ConnectionStrings配置对象
    /// </summary>
    public class ConnectionStrings
    {
        /// <summary>
        /// 数据库名字
        /// </summary>
        public string DbServer { get; set; }
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        public string ConnectionString { get; set; }
    }
}
