using Toybox.Application as App;

class Properties {
     hidden var myapp = App.getApp();
     
    // var apiToken; //api Token
     var balance = "0"; //balance
     var contractNum; //number of contract
     var status; //status of transponder
     var cardType; //type of payment card
     var baseCard; //base payment card
     var autoPayAmount; //auto pay amount
     var autoPayBalanceThreshold; //balance threshold
     var autoPayMaxAmountMonth; //max amount of month
     var linkedPhoneNumber; //linked phone number
     var cardQueryParams; //signature of transponder
     
   /* function setToken(data) {
       apiToken = data;
    }
    
    function getToken() {
      return apiToken;
    }*/
    
     
    function setBalance(data) {
       balance = data;
    }

    function setContractNum(data) {
       contractNum = data;
    }
  
    
    function setStatus(data) {
       status = data;
    }
    
  
    function setCardType(data) {
       cardType = data;
    }
    
  
    
    function setBaseCard(data) {
       baseCard = data;
    }
    
  
    
    function setAutoPayAmount(data) {
       autoPayAmount = data;
    }
    
  
    
    function setAutoPayBalanceThreshold(data) {
       autoPayBalanceThreshold = data;
    }
    
  
    function setAutoPayMaxAmountMonth(data) {
       autoPayMaxAmountMonth = data;
    }
    
   
    
    function setLinkedPhoneNumber(data) {
       linkedPhoneNumber = data;
    }
    
   
    
    function setCardQueryParams(data) {
       cardQueryParams = data;
    }
    
   
}