using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Application as App;

using ParamModule;

class AutoPayment extends Ui.View {
    hidden var myapp = App.getApp();
    hidden var _properties;
    
    function initialize(properties) { 
        System.println("Payment initialize");
        _properties = properties;
        Ui.View.initialize(); 
    }
    
    function onLayout(dc) {
       setLayout(Rez.Layouts.MainLayout(dc));
       System.println("onLayout() called");
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
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/3.8, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleCard+": "+_properties.getBaseCard(), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth()/3, dc.getHeight()/2.5, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleAutoPayAmount+": "+_properties.getAutoPayAmount() , Graphics.TEXT_JUSTIFY_RIGHT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth()/3, dc.getHeight()/1.8, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleAutoPayThreshold+": "+_properties.getAutoPayBalanceThreshold() , Graphics.TEXT_JUSTIFY_RIGHT | Graphics.TEXT_JUSTIFY_VCENTER);
    }

}