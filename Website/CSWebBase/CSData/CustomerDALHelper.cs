using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CSCore.DataHelper;
using System.Data.SqlClient;

namespace CSWebBase.CSData
{
    public class CustomerDALHelper
    {
        public static void UpdateCartAbandonment(int cartAbandonmentId, string landingUrl, string refUrl)
        {
            string connectionString = ConfigHelper.GetDBConnection();
            String ProcName = "pr_update_cartAbandonment";
            SqlParameter[] ParamVal = new SqlParameter[3];
            ParamVal[0] = new SqlParameter("CartAbandonmentId", cartAbandonmentId);
            ParamVal[1] = new SqlParameter("RequestUrl", landingUrl);
            ParamVal[2] = new SqlParameter("RefererUrl", refUrl);
            BaseSqlHelper.ExecuteNonQuery(connectionString, ProcName, ParamVal);
        }
    }
}
