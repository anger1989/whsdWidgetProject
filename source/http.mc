using Toybox.Communications as Comm;

class HttpSpec {
   var httpCode = -1; 
   var apiUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36";
   var apiUrl = "";
   var apiLogin = "";
   var apiPass = "";
   
   hidden var urlOptions = {};
 
   function getHttpRequest(urlRequest, urlParams, urlOptions, urlMethod) {
         Comm.makeWebRequest(urlRequest, urlParams, urlOptions, urlMethod);
         httpCode = -1;
             }
             
   function HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED(params, method) {
         urlOptions = {   "Content-Type" => Comm.HTTP_RESPONSE_CONTENT_TYPE_URL_ENCODED, 
    	                  "User-Agent" => apiUserAgent };
         getHttpRequest(apiUrl, params, urlOptions, method);  
   }
   
   function HTTP_REQUEST_METHOD_GET(params, method) {
         urlOptions = { "Content-Type" => Comm.HTTP_REQUEST_METHOD_GET, 
    	                  "User-Agent" => apiUserAgent };
         getHttpRequest(apiUrl, params, urlOptions, method);      
   }
   
   function HTTP_REQUEST_METHOD_POST(params, method, url) {
         urlOptions = {:method => 3, 
                       "Content-Type" => Comm.HTTP_REQUEST_METHOD_POST, 
    	               "User-Agent" => apiUserAgent};
         getHttpRequest(url, params, urlOptions, method);  
   }
}