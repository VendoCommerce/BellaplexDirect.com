using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using CSBusiness;
using CSCore.Utils;
using System.Collections;
using System.Data;
using System.Text;
using AjaxControlToolkit;
using CSBusiness.Attributes;
using System.Collections.Generic;
using System.Web;


namespace CSWeb.Admin
{
    public partial class SKUItem : System.Web.UI.Page, IAttributesPage
    {
        public int SkuId = 0;

        private Sku skuItem;

        public string AttributeFieldsInfoStateKey
        {
            get
            {
                return "AttributeFieldsInfoStateKey";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["skuid"] != null)
            {
                SkuId = Convert.ToInt32(Request["skuid"].ToString());
                
            }

            if (!Page.IsPostBack)
            {
                ddlCategory.DataSource = CSFactory.GetAllCategories();
                ddlCategory.DataTextField = "Title";
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataBind();
                ddlCategory.Items.Insert(0, new ListItem("Select", "0"));

                DisplayFormSKUAttribute();
                
                if (SkuId > 0)
                {
                    skuItem = new SkuManager().GetSkuByID(SkuId);

                    PopulateFields();
                }                
            }
        }

        protected void PopulateFields()
        {         
            txtTitle.Text = skuItem.Title;
            txtSkuCode.Text = skuItem.SkuCode;
            txtOfferCode.Text = skuItem.OfferCode;
            txtfullprice.Text = String.Format("{0:0.##}", skuItem.FullPrice);
            txtinitialprice.Text = String.Format("{0:0.##}", skuItem.InitialPrice); 
            txtWeight.Text =  skuItem.Weight.ToString();
            txtStock.Text = skuItem.StockQty.ToString();
            cbAvailable.Checked = Convert.ToBoolean(skuItem.IsAvailable);
            txtImagePath.Text = skuItem.ImagePath;
            ftbShortDesc.Content = skuItem.ShortDescription;
            ftbLongDesc.Content = skuItem.LongDescription;
            ftbEmailDesc.Content = skuItem.EmailDescription;
            ddlCategory.Items.FindByValue(skuItem.CategoryId.ToString()).Selected = true;

            if (skuItem.AttributeValues.Count > 0)
            {
                foreach (string attributeName in skuItem.AttributeValues.Keys)
                {
                    Control field = PanelAttributes.FindControl(AttributesPresentation.GetPageFieldId(attributeName));

                    if (field != null)
                        AttributesPresentation.Populate(field, skuItem.AttributeValues[attributeName]);
                }
            }

            if (skuItem.IsAvailable)
            {
                cbAvailable.Checked = true;
            }
         
            if (skuItem.IsTaxable)
            {
                rbListTaxable.Items.FindByValue("Yes").Selected = true;
                pnlTaxableAmount.Visible = true;
                txtTaxAmount.Text = String.Format("{0:0.##}", skuItem.TaxableFullAmount); 
                                     
            }
            else
            {
                rbListTaxable.Items.FindByValue("No").Selected = true;
                pnlTaxableAmount.Visible = false;                
            }
            
        }

        protected void btnAction_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Save")
            {
                if (Page.IsValid)
                {
                    Sku sku = new SkuManager().GetSkuItem();
                    sku.SkuId = SkuId;
                    sku.Title = CommonHelper.fixquotesAccents(txtTitle.Text);
                    sku.SkuCode = txtSkuCode.Text;
                    sku.CategoryId = Convert.ToInt32(ddlCategory.SelectedValue); 
                    sku.OfferCode = txtOfferCode.Text;
                    sku.FullPrice = Convert.ToDecimal(txtfullprice.Text);
                    sku.InitialPrice = Convert.ToDecimal(txtinitialprice.Text);
                    sku.ImagePath = txtImagePath.Text;
                    if (txtStock.Text.Length > 0)
                        sku.StockQty = Convert.ToInt32(txtStock.Text);
                    else
                        sku.StockQty = 0;
                    sku.IsAvailable = cbAvailable.Checked;
                    if (rbListTaxable.SelectedIndex == 0)
                    {
                        sku.IsTaxable = true;
                    }
                    else
                    {
                        sku.IsTaxable = false;
                    }

                    if (pnlTaxableAmount.Visible)
                        sku.TaxableFullAmount = Convert.ToDecimal(txtTaxAmount.Text);
                    else
                        sku.TaxableFullAmount = 0;
                    if (txtWeight.Text.Length > 0)
                        sku.Weight = Convert.ToDecimal(txtWeight.Text);
                    else
                        sku.Weight = 0;
                    sku.ShortDescription = CommonHelper.fixquotesAccents(ftbShortDesc.Content);
                    sku.LongDescription = CommonHelper.fixquotesAccents(ftbLongDesc.Content);
                    sku.EmailDescription = CommonHelper.fixquotesAccents(ftbEmailDesc.Content);
                    sku.CreateDate = DateTime.Now;
                    sku.ModifyDate = DateTime.Now;

                    sku.AttributeValues = AttributesPresentation.GetAttributeValues(ViewState, AttributeFieldsInfoStateKey, HttpContext.Current);

                    new SkuManager().InsertSku(sku);
                }
            }

            Response.Redirect("skulist.aspx");
        }

        protected void rbListTaxable_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (rbListTaxable.SelectedIndex == 0)
            {
                pnlTaxableAmount.Visible = true;;
            }
            else
            {
                pnlTaxableAmount.Visible = false;
            }    
        }

        protected void DisplayFormSKUAttribute()
        { 
          Table tblAttributes = new Table();
          int count = 0;
          foreach (CSBusiness.Attributes.Attribute attribute in Sku.GetAttributes( Sku.objectName))
          {
              count++;
              
              if (attribute.ObjectAttributeTypeName.ToLower() == "rich-control")
              {
                  TableRow row1 = new TableRow();
                  TableCell col1 = new TableCell();
                  col1.Attributes.Add("align", "right");
                  col1.Attributes.Add("class", "tblrowhdr");
                  col1.Attributes.Add("valign", "top");
                  Label name = new Label();
                  name.Text = attribute.DisplayLabel;
                  col1.Controls.Add(name);
                  row1.Cells.Add(col1);

                  AjaxControlToolkit.HTMLEditor.Editor Editor1 = new AjaxControlToolkit.HTMLEditor.Editor();
                  Editor1.Height = new Unit(200, UnitType.Pixel);
                  Editor1.Width = new Unit(500, UnitType.Pixel);
                  Editor1.AutoFocus = true;
                  Editor1.ID = AttributesPresentation.GetPageFieldId(attribute.Name); 
                  Editor1.Attributes.Add("runat", "server");
                                    
                  TableCell col2 = new TableCell();
                  col1.Attributes.Add("class", "rowbody");
                  col2.Controls.Add(Editor1);
                  row1.Cells.Add(col2);

                  PanelAttributes.Controls.Add(row1);

                  AttributesPresentation.SetAttributePageInfo(ViewState, AttributeFieldsInfoStateKey, attribute.Name,
                      AttributesPresentation.GetAttributePageControlInfo(Editor1));
              }
              else
              {
                  TableRow row1 = new TableRow();
                  TableCell col1 = new TableCell();
                  col1.Attributes.Add("align", "right");
                  col1.Attributes.Add("class", "tblrowhdr");
                  col1.Attributes.Add("valign", "top");
                  Label name = new Label();
                  name.Text = attribute.DisplayLabel;
                  col1.Controls.Add(name);
                  row1.Cells.Add(col1);

                  TableCell col2 = new TableCell();
                  col1.Attributes.Add("class", "rowbody");
                  TextBox tb1 = new TextBox();
                  tb1.ID = AttributesPresentation.GetPageFieldId(attribute.Name); 
                  tb1.MaxLength = 200;
                  tb1.Width = new Unit(40, UnitType.Percentage);
                  tb1.Attributes.Add("runat", "server");
                                    
                  col2.Controls.Add(tb1);
                  row1.Cells.Add(col2);
                  //  tblAttributes.Rows.Add(row1);
                  PanelAttributes.Controls.Add(row1);

                  AttributesPresentation.SetAttributePageInfo(ViewState, AttributeFieldsInfoStateKey, attribute.Name,
                      AttributesPresentation.GetAttributePageControlInfo(tb1));
              }
          }


          PanelAttributes.Visible = count > 0;

        }
    }
}