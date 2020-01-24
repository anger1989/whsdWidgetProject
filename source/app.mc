using Toybox.Application;
using Toybox.System as Sys;

class app extends Application.AppBase {
    hidden var properties = new Properties();
    hidden var httpSpec = new HttpSpec();
    hidden var getData = new GetData(httpSpec);   
    hidden var confLoad = new ConfModule();
    
    
    function initialize() {
        AppBase.initialize();
        httpSpec.apiUrl = ApiFunctions.apiUrl; 
        confLoad.loadParamData();      
        httpSpec.apiLogin = confLoad.Login;
        httpSpec.apiPass = confLoad.Pass;
    }

    // onStart() is called on application start up
    function onStart(state) {
    
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [new view(getData, properties), new MainDelegate(getData, properties) ];
    }

}