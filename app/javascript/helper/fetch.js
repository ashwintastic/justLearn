//import {API_SERVER_URL} from '../config/'

// TODO handle http error (throw error on statusCode >= 400)
// Why passing object in params???
export default function callApi(api_url, method = 'get', data = null) {
  var API_SERVER_URL = 'http://localhost:3000/'
 
  const opts = {
    method: method,
    headers: {
      Accept: 'application/json',
      'Content-Type': 'application/json',
      'authorization': 'bearer ' 
    }
  };

  if (data) {
    opts.data = JSON.stringify(data);
  }
  return fetchWrapper(api_url, opts);
}

function loggerAPICall(url,method,data,options){
  let time = new Date().toLocaleString();
  console.log(" ========== API Call to SERVER START  ========== "+time);
  console.log(" -- API URL: "+url);
  console.log(" -- API Method: "+method);
  console.log(" -- API Data: ");
  console.log(data);
  console.log(" -- API Options: ");
  console.log(options);
  console.log(" ========== API Call to SERVER END ========== "+time);
}

function fetchWrapper (api_url, opts){
     let requestParamObj= {}
     if(opts.method=='get'){
        requestParamObj = {
          method:opts.method
        }
        api_url = api_url
     }
     else if(opts.method=='post'){
        requestParamObj = {
            method: opts.method,
            headers: opts.headers,
            body: opts.data
        }
     }

    loggerAPICall(api_url,opts.method,opts.data,opts.headers)

     return (
      fetch(api_url, requestParamObj)
      .then((resp) => resp.json())
      .then(response => {
         console.log(" ********* API Response ********* ",response);
         return response;
      })
      .catch(error => { 
          console.log('request failed', error); 
          return error;
      })

     )
}