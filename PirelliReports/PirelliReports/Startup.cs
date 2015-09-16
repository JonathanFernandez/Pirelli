using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PirelliReports.Startup))]
namespace PirelliReports
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
