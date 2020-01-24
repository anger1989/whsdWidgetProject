module ApiFunctions {
       const apiUrl = "https://mcabinet.nch-spb.com/onyma/system/api/json";
       const realm = "WHSD";
       const autoPayUrl = "https://mpaymentsso.nch-spb.com/to-replenish?";
       const getBindCardUrl = "https://mpaymentsso.nch-spb.com/bind/start?";
       const getManageCardUrl = "https://mpaymentsso.nch-spb.com/to-manage?";
       
       // POST. Get token function. params: user, pass, realm
       const getToken = "open_session";  //POST
       // GET. Get contract function. params: auth_token
       const getAccountState = "onm_api_toll_api_contract_info"; //GET
       //params: auth_token
       const getAccountInfo = "onm_api_toll_api_mobile_rm_party"; //GET
       //params: auth_token
       const getAccountStatistics = "onm_api_toll_api_mobile_pan_mon"; //GET
        
       const getTransactions = "onm_api_toll_api_mobile_wall"; //GET
       
       const getTransponders = "onm_api_toll_api_mobile_pan"; //GET
       
       const easyRestoreRequest = "onm_api_toll_api_mobile_easy_remaind_passwd"; //GET
       
       const easyRestoreConfirm = "onm_api_toll_api_mobile_easy_change_passwd"; //GET
       
       const getTransponderOptions = "onm_api_toll_api_mobile_get_to_list"; //GET
       
       const connectTransponderOption = "onm_api_toll_api_mobile_add_to"; //GET
       
       const disconnectTransponderOption = "onm_api_toll_api_mobile_del_to"; //POST
       
       const changeTransponderOption = "onm_api_toll_api_mobile_set_to_option"; //POST
       
       const renameTransponder = "onm_api_toll_api_mobile_set_pan_alias"; //POST
              
       const getAccountParams = "onm_api_toll_api_mobile_param"; //POST
       
       const setAccountParams = "onm_api_toll_api_mobile_set_param"; //POST
       
       const getAutoPaySettings = "onm_api_toll_api_mobile_get_auto_pay_params"; //POST
       
       const setAutoPaySettings = "onm_api_toll_api_mobile_set_auto_pay_params"; //POST
       
       const getCardQueryParams = "onm_api_toll_api_mobile_sign_phone_number_url"; //GET
       
       const linkPhoneNumber = "onm_api_toll_api_mobile_link_phone_number"; //POST
}