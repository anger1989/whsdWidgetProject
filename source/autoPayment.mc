using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Application as App;

using ParamModule;

class AutoPayment extends Ui.View {
    hidden var myapp = App.getApp();
      
    
    function initialize() { 
        System.println("Payment initialize");
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
        dc.drawText(dc.getWidth()/2, dc.getHeight()/3.8, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleCard+": "+myapp.getProperty("baseCard") , Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth()/3, dc.getHeight()/2.5, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleAutoPayAmount+": "+myapp.getProperty("autoPayAmount") , Graphics.TEXT_JUSTIFY_RIGHT | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth()/3, dc.getHeight()/1.8, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleAutoPayThreshold+": "+myapp.getProperty("autoPayBalanceThreshold") , Graphics.TEXT_JUSTIFY_RIGHT | Graphics.TEXT_JUSTIFY_VCENTER);
    }

}