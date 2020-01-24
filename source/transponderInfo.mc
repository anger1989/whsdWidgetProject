using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Application as App;

using ParamModule;

class TransponderInfo extends Ui.View {
    hidden var myapp = App.getApp();
    hidden var _properties;  
    
    function initialize(properties) { 
        System.println("Transponder info initialize");
        _properties = properties;
        Ui.View.initialize(); 
    }
    
    function onLayout(dc) {
       setLayout(Rez.Layouts.MainLayout(dc));
       System.println("onLayout() called");
    }
    
    function onShow() {
         System.println("TranspInfo onShow() called");
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
        dc.drawText(dc.getWidth()/2, dc.getHeight()/4.2, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleAccount , Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/3, Graphics.FONT_SMALL, _properties.contractNum , Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_SYSTEM_MEDIUM, ParamModule.titleStatus , Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/1.6, Graphics.FONT_SMALL, _properties.status, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

}