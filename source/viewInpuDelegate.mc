using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Application as App;


using ParamModule;
using ApiFunctions;
using UrlDictionary;

class MainDelegate extends Ui.BehaviorDelegate {
   hidden var _properties;
   hidden var _getData;
   
   
   function initialize(getData, properties) {
         _properties = properties;
         _getData = getData;
         Ui.BehaviorDelegate.initialize();
   }
   
    function onSelect() {
        var menu = new Ui.Menu();
        var delegate;
        menu.setTitle("...");
        menu.addItem(ParamModule.titleMenuAcc, :accInfo);
        menu.addItem(ParamModule.titleMenuAutoPay, :autoPay);
        menu.addItem(ParamModule.titleMenuPay, :accPay);
        delegate = new MenuDelegate(_getData, _properties); 
        WatchUi.pushView(menu, delegate, WatchUi.SLIDE_IMMEDIATE);
        return true;
  }
}

class MenuDelegate extends Ui.MenuInputDelegate {
    hidden var myapp = App.getApp();
    hidden var __properties;
    hidden var __getData;
    
    function initialize(_getData, _properties) {
        __properties = _properties;
        __getData = _getData;
         MenuInputDelegate.initialize();
    }

    
    function onMenuItem(item) {
        var delegate = new InputDelegate();
        if ( item == :accInfo ) {
             var accInfoView = new TransponderInfo(__properties);
             Ui.switchToView(accInfoView, delegate, Ui.SLIDE_LEFT);
        } else if ( item == :autoPay ) {
             var autoPaymentView = new AutoPayment(__properties);
             __getData.getAutoPaySettings();
             Ui.switchToView(autoPaymentView, delegate, Ui.SLIDE_LEFT);
            
        } else if ( item == :accPay) {
             var _paymentView = new PaymentView(__properties, __getData);
             __getData.getCardQueryParams();
             Ui.switchToView(_paymentView, delegate, Ui.SLIDE_LEFT); 
             Comm.openWebPage("https://mpaymentsso.nch-spb.com/to-replenish?"+myapp.getProperty("cardQueryParams")+"&pan=6362875000003730736&amount=100", null, null);
            
        }
    }
 
}

class InputDelegate extends Ui.InputDelegate {
    function initialize() {
        Ui.InputDelegate.initialize();
   }
}