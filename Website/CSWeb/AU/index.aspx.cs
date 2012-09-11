using System;
using System.Text;
using CSCore;
using CSCore.Utils;
using CSBusiness.Preference;
using CSBusiness;
using System.Web;
using CSBusiness.Web;

namespace CSWeb.AU.Store
{
    public partial class index : CSBasePage
    {
        protected override bool IsLandingPage
        {
            get
            {
                return true;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e); 

        }
    }
}