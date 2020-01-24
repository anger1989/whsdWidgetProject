using Toybox.WatchUi as Ui;
using Toybox.Application as App;
using Toybox.Graphics;
using Toybox.Lang as Lang;

using ParamModule;
using ApiFunctions;
using UrlDictionary;

class GetData{
    hidden var myapp = App.getApp();
       
    hidden var urlParams = "";
    hidden var urlMethod = "";
    hidden var _httpSpec;
    hidden var _properties;
    
     function initialize(httpSpec, properties) {
           _httpSpec = httpSpec;
           _properties = properties;
     }
     
//GET DATA HTTP 

   // function for get API token
    function getToken() {
    	System.println("Querying Token...");
    	urlParams = {"function" => ApiFunctions.getToken, 
    	             "user" => _httpSpec.apiLogin, 
    	             "pass" => _httpSpec.apiPass, 
    	             "realm" => UrlDictionary.realm};
    	System.println(urlParams);
    	urlMethod = method(:receiveToken);
    	_httpSpec.HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED(urlParams, urlMethod);
    	System.println("check getToken");
    	
    }
    
    function receiveToken(responseCode, data) {
        System.println("check receiveToken");
        _httpSpec.httpCode = responseCode;
        if (responseCode == 200) {
           data = data["return"];
           System.println(data);
           myapp.setProperty("apiToken", data);
           System.println("Token"+myapp.getProperty("apiToken"));
           Ui.requestUpdate();  
        }
        else
        {
           Ui.requestUpdate();
           System.println("Not Response" +responseCode);
        }
    }
    
   
   //function for get Account data     
    function getAccountState(apiToken) {
       System.println("GetAccountState called");
    	urlParams = {"function" => ApiFunctions.getAccountState, 
    	             "auth_token" => apiToken};     
    	urlMethod = method(:receiveAccountState);
    	_httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
    	System.println("check getAccountState");
    	
     }
     
    function receiveAccountState(responseCode, data) {
       System.println("check receiveAccountState");
      
       _httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
          data = data["return"];
          System.println(data);
          _properties.setBalance(data[0]["remainder"]);
          _properties.setContractNum(data[0]["contract_num"]);
          _properties.setStatus(data[0]["status"]);
          System.println("Balance"+_properties.balance);
          Ui.requestUpdate();
       }
       else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
   }
   
   
  //function for get Auto Pay Settings   
    function getAutoPaySettings(apiToken) {
        urlParams = {"function" => ApiFunctions.getAutoPaySettings, 
    	             "auth_token" => apiToken};
    	urlMethod = method(:receiveAutoPaySettings);
    	_httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
    }
   
   function receiveAutoPaySettings(responseCode, data) {
       _httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
          data = data["return"];
          System.println(data);
          _properties.setCardType(data["p_base_card_type"]);
          _properties.setBaseCard(data["p_base_card"]);
          _properties.setAutoPayAmount(data["p_auto_pay_amount"]);
          _properties.setAutoPayBalanceThreshold(data["p_auto_pay_balance_threshold"]);
          _properties.setAutoPayMaxAmountMonth(data["p_auto_pay_max_amount_month"]);
          Ui.requestUpdate();
       }
       else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
    }
    
   //function for get account info
    function getAccountInfo(apiToken) {
        urlParams = {"function" => ApiFunctions.getAccountInfo, 
    	             "auth_token" => apiToken};
    	urlMethod = method(:receiveAccountInfo);
    	_httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
    }
    
    function receiveAccountInfo(responseCode, data) {
       _httpSpec.httpCode = responseCode;
       if (responseCode == 200) {
          data = data["return"];
          _properties.setLinkedPhoneNumber(data[0]["linked_phone_number"]);
          System.println(data[0]["linked_phone_number"]);
          Ui.requestUpdate();
        }
        else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
    }
    
  //function for get signature  
    function getCardQueryParams(apiToken) {
     //  System.println(myapp.getProperty("apiToken"));
     //  System.println(myapp.getProperty("linkedPhoneNumber"));
       
       urlParams = {"function" => ApiFunctions.getCardQueryParams, 
    	             "auth_token" => apiToken,
    	             "p_phone_number" => _properties.cardQueryParams};
       urlMethod = method(:receiveCardQueryParams);
       _httpSpec.HTTP_REQUEST_METHOD_GET(urlParams, urlMethod);
    }
    
   function receiveCardQueryParams(responseCode, data) {
      _httpSpec.httpCode = responseCode;
      System.println(responseCode);
       if (responseCode == 200) {
         data = data["return"];        
         _properties.setCardQueryParams(data);
         Ui.requestUpdate();
        }
        else
       {
           Ui.requestUpdate();
           System.println("Not Response");
       }
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
       _httpSpec.HTTP_REQUEST_METHOD_POST(urlParams, urlMethod, url);
    }
    
    function receiveReplenish(responseCode, data) {
       _httpSpec.httpCode = responseCode;
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
   
/*setters
   function setAutoPaySettings() {
                      /*  p_auto_pay_amount: t,
                        p_auto_pay_balance_threshold: n,
                        p_auto_pay_max_amount_month: o 
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
 */   
 
   
}