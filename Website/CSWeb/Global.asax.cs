using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using CSBusiness.Resolver;
using System.Configuration;



namespace CSWeb
{
    public class Global : System.Web.HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            CSResolve.InitializeWith(new DependencyResolverFactory());
            int visitorscount = 0;
            Application["visitorscount"] = visitorscount;
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex.InnerException != null)
            {
                //Exception baseEx = Server.GetLastError().GetBaseException();
                //CSCore.CSLogger.Instance.LogException(baseEx.Message, baseEx);
                CSCore.CSLogger.Instance.LogException(ex.InnerException.Message, ex.InnerException);
            }
        }

        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            if (ConfigurationManager.AppSettings["SessionTTL"] != null)
                Session.Timeout = Convert.ToInt32(ConfigurationManager.AppSettings["SessionTTL"]);
        }

        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

        }

    }
}
