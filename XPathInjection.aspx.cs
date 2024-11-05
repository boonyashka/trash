using System;
using System.Web.UI;
using System.Xml;

namespace VulnSmoke
{
    public partial class XPathInjection : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var doc = new XmlDocument();
            doc.Load("booksort.xml");
            XmlNode root = doc.DocumentElement;
            if (Request.Params["node"] != null)
            {
                if (root != null)
                {
                    root.SelectNodes(Request.Params["node"]);
                }
            }
        }
    }
    }
}