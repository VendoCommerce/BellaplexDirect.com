using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace CSWeb.Admin
{
    public partial class CacheUtility : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.BaseLoad();

                lbltext.Text = this.Context.Cache.Count.ToString();
            
                foreach (DictionaryEntry item in this.Context.Cache)
                {

                    ddlList.Items.Add(new ListItem(item.Key as string, item.Key as string));
              
                }

                ddlList.Items.Insert(0, new ListItem("Select", "Select"));
                ddlList.DataBind();
            }
               
            }
       

    protected void btnAction_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {

            string selectedItem = ddlList.SelectedItem.Value;
            object cacheData = this.Context.Cache[selectedItem];
            if (cacheData != null)
            {
                this.Context.Cache.Remove(selectedItem);
            }

            lbltext.Text = this.Context.Cache.Count.ToString();
}
    } 
}