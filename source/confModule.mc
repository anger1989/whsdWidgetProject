using Toybox.Application as App;

class ConfModule {
     
     hidden var myapp = App.getApp();
    
     var criticalBalance = 150;
     var Login = "";
     var Pass = "";
     
     function loadParamData() {
        Login = App.Properties.getValue("api_login"); 
        Pass = App.Properties.getValue("api_pass");
        myapp.setProperty("criticalBalance", App.Properties.getValue("critical_balance"));
     }
}