using Toybox.Application as App;

class Properties {
     hidden var myapp = App.getApp();
     
     var balance = "0"; //balance
     var contractNum; //number of contract
     var status; //status of transponder
     var cardType; //type of payment card
     var baseCard; //base payment card
     var autoPayAmount; //auto pay amount
     var autoPayBalanceThreshold; //balance threshold
     var autoPayMaxAmountMonth; //max amount of month
     var linkedPhoneNumber; //linked phone number
  //   var cardQueryParams; //signature of transponder
    //token  
    function setApiToken(data) {
      myapp.setProperty("apiToken", data);
    }
    
    function getApiToken() {
     return myapp.getProperty("apiToken");
    }
    //balance
    function setBalance(data) {
       myapp.setProperty("balance", data);
    }
    
    function getBalance() {
       return myapp.getProperty("balance");
    }
    //contractNum
    function setContractNum(data) {
       myapp.setProperty("contractNum", data);
    }
    
    function getContractNum() {
       return myapp.getProperty("contractNum");
       
    }
    //status
    function setStatus(data) {
       myapp.setProperty("status", data);
    }
    
    function getStatus() {
       return myapp.getProperty("status");
    }
    //cardType
    function setCardType(data) {
       myapp.setProperty("cardType", data);
    }
    
    function getCardType() {
       return myapp.getProperty("cardType");
    }
    //baseCard
    function setBaseCard(data) {
       myapp.setProperty("baseCard", data);
    }
    
    function getBaseCard() {
      return myapp.getProperty("baseCard");
    }
    //autoPayAmoung
    function setAutoPayAmount(data) {
       myapp.setProperty("autoPayAmount", data);
    }
    
    function getAutoPayAmount() {
       return myapp.getProperty("autoPayAmount");
    }
    //autoPayBalanceThreshold
    function setAutoPayBalanceThreshold(data) {
       myapp.setProperty("autoPayBalanceThreshold", data);
    }
    
    function getAutoPayBalanceThreshold() {
       return myapp.getProperty("autoPayBalanceThreshold");
    }
    //AutoPayMaxAmountMont
    function setAutoPayMaxAmountMonth(data) {
       myapp.setProperty("autoPayMaxAmountMonth", data);
    }
    
    function getAutoPayMaxAmountMonth() {
       return myapp.getProperty("autoPayMaxAmountMonth");
    }
    //phoneNumber
    function setLinkedPhoneNumber(data) {
       myapp.setProperty("linkedPhoneNumber", data);
    }
    
    function getLinkedPhoneNumber() {
       return myapp.getProperty("linkedPhoneNumber");
    }
    
    function clearProperties() {
       myapp.clearProperties();
    }
    
   /* function setCardQueryParams(data) {
       cardQueryParams = data;
    }*/
    
   
}