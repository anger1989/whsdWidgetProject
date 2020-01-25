using Toybox.Application;
using Toybox.System as Sys;


class app extends Application.AppBase {
    hidden var properties = new Properties();
    hidden var httpSpec = new HttpSpec();
    hidden var confLoad = new ConfModule(httpSpec);
    hidden var getData = new GetData(httpSpec, properties);   
    
    
    function initialize() {
        AppBase.initialize();
        confLoad.loadParamData();
        confLoad.loadUrlData();      
        
    }

    // onStart() is called on application start up
    function onStart(state) {
           System.println("OnStart");
        }

    // onStop() is called when your application is exiting
    function onStop(state) {
           properties.clearProperties();
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [new view(getData, properties, confLoad), new MainDelegate(getData, properties) ];
    }

}