using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace demo5webapi.Src.Common
{
    /// <summary>
    /// 读写Json文件
    /// </summary>
    public class ReadJsonFile
    {
        /// <summary>
        /// 读取Json文件
        /// </summary>
        /// <param name="jsonFileName"></param>
        public void readJson(string jsonFileName)
        {
            string folder = jsonFileName;
            //read the json 
            var sourceContent = File.ReadAllText(folder);
            //parse as array  
            var sourceobjects = JArray.Parse("[" + sourceContent + "]");
            JObject source = JObject.Parse(sourceContent);
            string str = source["ConnectionStrings"]["DbConn"].ToString().Trim();
            ;
        }

        /// <summary>
        /// 获取 json 中的值
        /// </summary>
        /// <param name="token"></param>
        /// <param name="propName"></param>
        /// <param name="stringsList"></param>
        public static void tranversJToken(JToken token, string propName, ref Dictionary<string, string> stringsList)
        {
            var prop = token as JProperty;
            if (prop != null)
            {
                propName = propName + "_" + prop.Name;
            }
            if (prop != null && prop.Value.GetType().Name.ToLower().Equals("jvalue"))
            {
                string _propName = propName.Substring(1);
                string _prop = prop.Value.ToString();
                stringsList[_propName] = _prop;
                return;
            }

            foreach (JToken child in token.Children())
            {
                tranversJToken(child, propName, ref stringsList);
            }
        }

        /// <summary>
        /// 在已存在 json 文件中添加 json 数据 。用 JObject add 方法添加数据，在最后以 string 类型写入进文件
        /// </summary>
        public static void addJson()
        {
            //read the other json
            var sourceContent = File.ReadAllText(@"..\..\JsonFile\resourse.json");
            var sourceobjects = JArray.Parse("[" + sourceContent + "]"); // parse as array  
            JObject source = JObject.Parse(sourceContent);

            //read the local json
            string p = @"..\..\JsonFile\resourse.zh-CN.json";
            var content = File.ReadAllText(p);
            var objects = JArray.Parse("[" + content + "]"); // parse as array  
            JObject o = JObject.Parse(content);

            //foreach the JObject add the value
            foreach (JToken child in source.Children())
            {
                var prop = child as JProperty;
                string jsonText = prop.Value.ToString();
                JObject jo = (JObject)JsonConvert.DeserializeObject(jsonText);
                if (prop.Name == "choosecolor")
                {
                    //add the json value to local JOnbject
                    o.Add(prop.Name, new JObject(jo));
                }
            }

            //found the file exist 
            if (!File.Exists(p))
            {
                FileStream fs1 = new FileStream(p, FileMode.Create, FileAccess.ReadWrite);
                fs1.Close();
            }

            //write the json to file 
            File.WriteAllText(p, o.ToString());
        }

        /// <summary>
        /// 创建新的 json 文件
        /// </summary>
        public static void CreateJson()
        {
            JObject source = new JObject();
            source.Add("Name", "yanzhiyi");

            string p = @"..\..\NewJson\Create.json";
            //found the file exist 
            if (!File.Exists(p))
            {
                FileStream fs1 = new FileStream(p, FileMode.Create, FileAccess.ReadWrite);
                fs1.Close();
            }
            //write the json to file 
            File.WriteAllText(p, source.ToString());
        }
    }
}
