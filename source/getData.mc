using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.Graphics;
using Toybox.Lang as Lang;

using ParamModule;
using ApiFunctions;

class GetData{
       
    hidden var myapp = App.getApp();
    hidden var urlParams = "";
    hidden var urlMethod = "";
    hidden var httpSpec;
    
     function initialize(http) {
           httpSpec = http;
     }
     
//GET DATA HTTP 
    function getToken() {
    	System.println("Querying Token...");
    	urlParams = {"function" => ApiFunctions.getToken, 
    	             "user" => httpSpec.apiLogin, 
    	             "pass" => httpSpec.apiPass, 
    	             "realm" => ApiFunctions.realm};
    	urlMethod = method(:receiveToken);
    	httpSpec.HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED(urlParams, urlMethod);
    }
        
    function getAccountState() {
    	urlParams = {"function" => ApiFunctions.getAccountState, 
    	             "auth_token" => myapp.getProperty("apiToken")};
    	urlMethod = method(:receiveAccountState);
    	httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
     }
     
    function getAutoPaySettings() {
        urlParams = {"function" => ApiFunctions.getAutoPaySettings, 
    	             "auth_token" => myapp.getProperty("apiToken")};
    	urlMethod = method(:receiveAutoPaySettings);
    	httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
    }
    
    function getAccountInfo() {
        urlParams = {"function" => ApiFunctions.getAccountInfo, 
    	             "auth_token" => myapp.getProperty("apiToken")};
    	urlMethod = method(:receiveAccountInfo);
    	httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
    }
    
    function getCardQueryParams() {
       System.println(myapp.getProperty("apiToken"));
       System.println(myapp.getProperty("linkedPhoneNumber"));
       
       urlParams = {"function" => ApiFunctions.getCardQueryParams, 
    	             "auth_token" => myapp.getProperty("apiToken"),
    	             "p_phone_number" => myapp.getProperty("linkedPhoneNumber")};
       urlMethod = method(:receiveCardQueryParams);
       httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
    }
    
/* Get for pays */
    function postReplenish1(url) {
      System.println(url);
       urlParams = { "transponderIdPostfix" => "3730736", 
    	             "BaseFakeAuthPaymentForm[account]" => "6362875000003730736", 
    	             "BaseFakeAuthPaymentForm[sum]" => "100", 
    	             "SelectAccountForm[accounts]" => "-100500",
    	             "fake" => "(798)119-41-34",
    	             "BaseFakeAuthPaymentForm[payerPhone]" => "",
    	             "ZsdAutopayCardDataInputForm[pan]" => "",
    	             "visible_pan" => "XXXX - XXXX - XXXX - 3585",
    	             "ZsdAutopayCardDataInputForm[month]" => "06",
    	             "ZsdAutopayCardDataInputForm[year]" => "2022",
    	             "ZsdAutopayCardDataInputForm[holder]" => "IGOR GOLOVKO",
    	             "ZsdAutopayCardDataInputForm[cvv2]" => "",
    	             "ZsdAutopayCardDataInputForm[notBindCard]" => "",
    	             "BaseFakeAuthPaymentForm[customerContact]" => "",
    	             "BaseFakeAuthPaymentForm[offer]" => "1"};
       urlMethod = method(:receiveReplenish);
       httpSpec.HTTP_REQUEST_METHOD_POST(urlParams, urlMethod, url);
    }
    
    function receiveReplenish(responseCode, data) {
       httpSpec.httpCode = responseCode;
        if (responseCode == 200) {
           data = data;
           System.println(data);
           Ui.requestUpdate();
           
        }
        else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
    }

   
/*-----------------------------*/    
    
//setters
   function setAutoPaySettings() {
                      /*  p_auto_pay_amount: t,
                        p_auto_pay_balance_threshold: n,
                        p_auto_pay_max_amount_month: o */
        var threshold = myapp.getProperty("balance").toNumber() + 1;                
        urlParams = {"function" => ApiFunctions.setAutoPaySettings, 
    	              "auth_token" => myapp.getProperty("apiToken"),
    	              "p_auto_pay_amount" => 100,
    	              "p_auto_pay_balance_threshold" => threshold,
    	              "p_auto_pay_max_amount_month" => 100};
    	urlMethod = method(:receiveSetAutoPaySettings);
    	httpSpec.HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED(urlParams, urlMethod);               
        
   }


//receivers 
    function receiveToken(responseCode, data) {
       httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
           data = data["return"];
           myapp.setProperty("apiToken", data);
       }
       else
       {
           Ui.requestUpdate();
           System.println("Not Response" +responseCode);
       }
       }

    function receiveAccountState(responseCode, data) {
       httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
          data = data["return"];
          System.println(data);
          myapp.setProperty("balance", data[0]["remainder"]);
          myapp.setProperty("contractNum", data[0]["contract_num"]);
          myapp.setProperty("status", data[0]["status"]);
          Ui.requestUpdate();
       }
       else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
   }
    
   function receiveAutoPaySettings(responseCode, data) {
       httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
          data = data["return"];
          System.println(data);
          myapp.setProperty("cardType", data["p_base_card_type"]);
          myapp.setProperty("baseCard", data["p_base_card"]);
          myapp.setProperty("autoPayAmount", data["p_auto_pay_amount"]);
          myapp.setProperty("autoPayBalanceThreshold", data["p_auto_pay_balance_threshold"]);
          myapp.setProperty("autoPayMaxAmountMonth", data["p_auto_pay_max_amount_month"]);
          Ui.requestUpdate();
       }
       else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
    }
       
    function receiveSetAutoPaySettings(responseCode, data) {
       httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
          data = data[""];
       }
        else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
    
    }   
    
    function receiveAccountInfo(responseCode, data) {
       httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
          data = data["return"];
          myapp.setProperty("linkedPhoneNumber", data[0]["linked_phone_number"]);
          System.println(data[0]["linked_phone_number"]);
          Ui.requestUpdate();
        }
        else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
    }
    
    function receiveCardQueryParams(responseCode, data) {
      httpSpec.httpCode = responseCode;
      System.println(responseCode);
       if (responseCode == 200) {
         data = data["return"];
         System.println("Check");         
         myapp.setProperty("cardQueryParams", data);
         Ui.requestUpdate();
        }
        else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
    }
   
}