class Properties {
     var apiToken = ""; //api Token
     var balance = ""; //balance
     var contractNum = ""; //number of contract
     var status = ""; //status of transponder
     var cardType = ""; //type of payment card
     var baseCard = ""; //base payment card
     var autoPayAmount = ""; //auto pay amount
     var autoPayBalanceThreshold = ""; //balance threshold
     var autoPayMaxAmountMonth = ""; //max amount of month
     var linkedPhoneNumber = "" ; //linked phone number
     var cardQueryParams = ""; //signature of transponder
     
    function setToken(data) {
        apiToken = data;
    }
    
    function getToken() {
       return apiToken;
    }
    
    function setBalance(data) {
       balance = data;
    }
    
    function getBalance() {
       return balance;
    } 
    
    function setContractNum(data) {
       contractNum = data;
    }
    
    function getContractNum() {
       return contractNum;
    }
    
    function setStatus(data) {
       status = data;
    }
    
    function getStatus() {
       return status;
    }
    
    function setCardType(data) {
       cardType = data;
    }
    
    function getCardType() {
       return cardType;
    }
    
    function setBaseCard(data) {
       baseCard = data;
    }
    
    function getBaseCard() {
       return baseCard;
    }
    
    function setAutoPayAmount(data) {
       autoPayAmount = data;
    }
    
    function getAutoPayAmount() {
       return autoPayAmount;
    }
    
    function setAutoPayBalanceThreshold(data) {
       autoPayBalanceThreshold = data;
    }
    
    function getAutoPayBalanceThreshold() {
       return autoPayBalanceThreshold;
    }
    
    function setAutoPayMaxAmountMonth(data) {
       autoPayMaxAmountMonth = data;
    }
    
    function getAutoPayMaxAmountMonth() {
       return autoPayMaxAmountMonth;
    }
    
    function setLinkedPhoneNumber(data) {
       linkedPhoneNumber = data;
    }
    
    function getLinkedPhoneNumber() {
       return linkedPhoneNumber;
    }
    
    function setCardQueryParams(data) {
       cardQueryParams = data;
    }
    
    function getCardQueryParams() {
       return cardQueryParams;
    }
}