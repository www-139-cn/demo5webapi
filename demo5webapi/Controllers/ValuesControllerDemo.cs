using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using demo5webapi.Src.CommonInfo;
using demo5webapi.Src.Service;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace demo5webapi.Controllers
{
    [Route("api/demo")]
    public class ValuesControllerDemo : Controller
    {
        // GET: api/<controller>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1demo", "value2" };
        }

        //// GET api/<controller>/5
        //[HttpGet("{id}")]
        //public string Get(int id)
        //{
            
        //    return $"这个是demo增加的接口，输入的是ID=:{id}";
        //}

        // GET api/<controller>/"张三"
        [HttpGet("{userName}")]
        public List<BrotherSamUser> Get(string userName)
        {
            UserService userService = new UserService();
            List<BrotherSamUser> brotherSamUsers = userService.FindListByUserName(userName);
            return brotherSamUsers;
            //return $"这个是demo增加的接口，输入的是userName= : {userName}";
        }

        // POST api/<controller>
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
