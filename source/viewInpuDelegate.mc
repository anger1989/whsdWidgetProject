using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;
using Toybox.Application as App;


using ParamModule;
using ApiFunctions;

class MainDelegate extends Ui.BehaviorDelegate {
   hidden var _getData;
   
   
   function initialize(getData) {
         Ui.BehaviorDelegate.initialize();
         _getData = getData;
   }
   
    function onSelect() {
        var menu = new Ui.Menu();
        var delegate;
        menu.setTitle("...");
        menu.addItem(ParamModule.titleMenuAcc, :accInfo);
        menu.addItem(ParamModule.titleMenuAutoPay, :autoPay);
        menu.addItem(ParamModule.titleMenuPay, :accPay);
        delegate = new MenuDelegate(_getData); 
        WatchUi.pushView(menu, delegate, WatchUi.SLIDE_IMMEDIATE);
        return true;
  }
}

class MenuDelegate extends Ui.MenuInputDelegate {
    hidden var myapp = App.getApp();
    hidden var __getData;
    
    function initialize(_getData) {
        MenuInputDelegate.initialize();
        __getData = _getData;
    }

    
    function onMenuItem(item) {
        var accInfoView = new TransponderInfo();
        var autoPaymentView = new AutoPayment();
        var delegate = new InputDelegate();
        if ( item == :accInfo ) {
             Ui.switchToView(accInfoView, delegate, Ui.SLIDE_LEFT);
        } else if ( item == :autoPay ) {
             Ui.switchToView(autoPaymentView, delegate, Ui.SLIDE_LEFT);
            
        } else if ( item == :accPay) {
             var cardQuery = myapp.getProperty("cardQueryParams");
             var urlPart = cardQuery.substring(0, cardQuery.find("&_confirmdate"));
             __getData.getCardQueryParams();
             System.println(urlPart);
             System.println( myapp.getProperty("cardQueryParams"));
             __getData.postReplenish1(ApiFunctions.autoPayUrl+urlPart);
         //   Comm.openWebPage("https://mpaymentsso.nch-spb.com/to-replenish?"+myapp.getProperty("cardQueryParams")+"&pan=6362875000003730736&amount=100", null, null);
            
        }
    }
}

class InputDelegate extends Ui.InputDelegate {
    function initialize() {
        Ui.InputDelegate.initialize();
   }
}