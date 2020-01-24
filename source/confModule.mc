using Toybox.Application as App;
using UrlDictionary;


class ConfModule {
     
     hidden var myapp = App.getApp();
     hidden var _httpSpec;
     
     var criticalBalance = 150;
     var Login = "";
     var Pass = "";
     
     function initialize(httpSpec) {
        _httpSpec = httpSpec;
     }
     
     function loadParamData() {
        _httpSpec.apiLogin = App.Properties.getValue("api_login"); 
        _httpSpec.apiPass = App.Properties.getValue("api_pass");
        criticalBalance = App.Properties.getValue("critical_balance");
     }
     
     function loadUrlData() {
        _httpSpec.apiUrl = UrlDictionary.apiDataUrl; 
       
     }
}