using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Application as App;
using Toybox.Graphics;

using ParamModule;

class view extends Ui.View {
    
    hidden var _properties;
    hidden var _getData;
    hidden var myapp = App.getApp();
    
 
    function initialize(getData, properties) { 
        _properties = properties;
        _getData = getData;
        System.println("Initialize");
        System.println("Load login, pass...");
        Ui.View.initialize();  
 }

    // Load your resources here
    function onLayout(dc) {
       setLayout(Rez.Layouts.MainLayout(dc));
       System.println("onLayout() called");
       _getData.getToken();
       if (myapp.getProperty("apiToken") != null) {
       _getData.getAccountState();
    //   getData.getAutoPaySettings();
       _getData.getAccountInfo();
       }
       else
       { 
          var errormsg = ["error token"];
          dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
          dc.clear();
          dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
          for (var i = 0; i < errormsg.size(); i++) { 
           dc.drawText(dc.getWidth()/2, 10+(i*15), Graphics.FONT_XTINY, errormsg[i], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER) ;
        }
        }
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
         System.println("onShow() called");
    }
    
    
    function renderDisplay(dc) {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/3, Graphics.FONT_LARGE, ParamModule.titleText, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        if (myapp.getProperty("balance").toNumber() < myapp.getProperty("criticalBalance")) 
        {
                dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_BLACK);
                dc.drawText(dc.getWidth()/2, dc.getHeight()/1.5, Graphics.FONT_MEDIUM, ParamModule.criticalMsg, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
                
        }
        else 
        {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
                
        }
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_LARGE, myapp.getProperty("balance"), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        if (myapp.getProperty("token") == null && myapp.getProperty("balance") == null) {
          var errormsg = ["error data"];
          dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
          dc.clear();
          dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
          for (var i = 0; i < errormsg.size(); i++) { 
           dc.drawText(dc.getWidth()/2, 10+(i*15), Graphics.FONT_XTINY, errormsg[i], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER) ;
        }
        return;
        }
       dc.clear();
       renderDisplay(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
        Ui.requestUpdate();
    }
    
 
    }