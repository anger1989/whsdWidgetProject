using Toybox.WatchUi as Ui;
using Toybox.Application as App;

class AboutAppView extends Ui.View {

   function initialize() { 
        Ui.View.initialize();      
    }
 
   function onLayout(dc) {
              Ui.requestUpdate();
    }
    
   function onShow() {
         System.println("onShow() called");        
    } 
    
    function onUpdate(dc) {
       dc.clear();
       renderDisplay(dc);
    }

    function onHide() {
        Ui.requestUpdate();
    }
    
    function renderDisplay(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/3.8, Graphics.FONT_SYSTEM_SMALL, ParamModule.titleAboutApp+": "+ParamModule.appName , Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(dc.getWidth()/3, dc.getHeight()/2.5, Graphics.FONT_SYSTEM_SMALL, ParamModule.titleAboutVersion+": "+"-" , Graphics.TEXT_JUSTIFY_RIGHT | Graphics.TEXT_JUSTIFY_VCENTER);              
        dc.drawText(dc.getWidth()/6, dc.getHeight()/1.8, Graphics.FONT_SYSTEM_SMALL, ParamModule.titleAboutProgr+": "+ParamModule.appProgr , Graphics.TEXT_JUSTIFY_LEFT | Graphics.TEXT_JUSTIFY_VCENTER);
    }
}
