using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Application as App;

using ParamModule;
using UrlDictionary;

class PaymentView extends Ui.View {
   hidden var myapp = App.getApp();
    hidden var _properties;
    hidden var _getData;
    
    function initialize(properties, getData) { 
        System.println("Payment initialize");
        _properties = properties;
        _getData = getData;
        Ui.View.initialize(); 
    }
    
    function onLayout(dc) {
       setLayout(Rez.Layouts.MainLayout(dc));
       System.println("onLayout() called");
       
       System.println("phone: "+_properties.getLinkedPhoneNumber());
    }
    
       
    function makeSignature() {
         var fullSignature = myapp.getProperty("cardQueryParams");
         System.println(fullSignature);
         var pastSignature = fullSignature.substring(0, fullSignature.find("&_confirmdate"));
         
         return pastSignature;
    }
    
    function onShow() {
         System.println("Payment onShow() called");
    }
    
    function onHide() {
        Ui.requestUpdate();
    }
    
    function onUpdate(dc) {
       dc.clear();
       renderDisplay(dc);
    }
    
    function renderDisplay(dc) {
        
        if (myapp.getProperty("cardQueryParams") == null){
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/3, Graphics.FONT_MEDIUM, ParamModule.titleLoadSignature, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else
        {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/3, Graphics.FONT_MEDIUM, ParamModule.titleLoadSignatureOk, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        Comm.openWebPage("https://mpaymentsso.nch-spb.com/to-replenish?"+_properties.getCardQueryParams()+"&pan=6362875000003730736&amount=100", null, null);
        
        }
    }
}