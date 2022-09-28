const fetch = require('node-fetch');
const xsenv = require('@sap/xsenv');

let service = null;
//Workflow
async function workflowPOST(name, path, headers, body) {
  xsenv.loadEnv();
  service = xsenv.readServices()[name];
  const serviceUrl = await getDestinationUrlWorkflow(service);
  const jwtToken = await getJWTTokenWorkflow();
  if (!headers) {
    headers = new fetch.Headers({
      'Content-Type': 'application/json'
    });
  }
  let basicAuthorization = `Bearer ${jwtToken}`;
  headers.set("Authorization", basicAuthorization);
  const response = await fetch(serviceUrl + path, { method: 'POST', headers: headers, body })
  return await response.text();
}


async function getDestinationUrlWorkflow(service) {
  return service.credentials.endpoints.workflow_rest_url;
}
async function getJWTTokenWorkflow() {
  const credentials = service.credentials;
  const clientId = credentials.uaa.clientid;
  const secret = credentials.uaa.clientsecret;
  const authUrl = credentials.uaa.url;
  const headers = new fetch.Headers();
  let authorization = `Basic ${Buffer.from(clientId + ':' + secret).toString("base64")}`;
  headers.set("Authorization", authorization);
  let url = authUrl + '/oauth/token?grant_type=client_credentials&response_type=token';
  const result = await fetch(url, { method: 'GET', headers: headers }).then((res)=>{
    return res.json()
  });
  return result.access_token;
}


//Other calls
async function serviceCall(name, path, method, headers, body) {
  xsenv.loadEnv();
  const serviceUrl = await getDestinationUrl(name);
  const jwtToken = await getJWTToken('capinvoice-xsuaa-service');
  if (!headers) {
    headers = new fetch.Headers({
      'Content-Type': 'application/json'
    });
  }
  let basicAuthorization = `Bearer ${jwtToken}`;
  headers.set("Authorization", basicAuthorization);

  if (method == 'GET'){
    const response = await fetch(serviceUrl + path, { method: 'GET', headers: headers })
    return await response.json()
  }

  if (method == 'POST') {
    const response = await fetch(serviceUrl + path, { method: 'POST', headers: headers, body })
    return await response.text()
  }
}


async function getDestinationUrl(name) {
  const destinationServiceName = 'capinvoice-destination-service'
  var jwt = await getJWTToken(destinationServiceName);
  const host = xsenv.getServices({ tag: destinationServiceName }).tag.uri
  const headers = new fetch.Headers();
  let basicAuthorization = `Bearer ${jwt}`;
  headers.set("Authorization", basicAuthorization);
  const url = host + '/destination-configuration/v1/destinations/' + name
  const response = await fetch(url, { method: 'GET', headers: headers })
  const data = await response.json();
  return data.destinationConfiguration.URL;
}



async function getJWTToken(serviceName) {
  const serviceGetToken = xsenv.readServices()[serviceName];
  const credentials = serviceGetToken.credentials;
  const clientId = credentials.clientid;
  const secret = credentials.clientsecret;
  const authUrl = credentials.url;
  const headers = new fetch.Headers();
  let authorization = `Basic ${Buffer.from(clientId + ':' + secret).toString("base64")}`;
  headers.set("Authorization", authorization);
  let url = authUrl + '/oauth/token?grant_type=client_credentials&response_type=token';
  const result = await fetch(url, { method: 'GET', headers: headers }).then((res)=>{
    return res.json()
  });
  return result.access_token;
}

module.exports = {
  serviceCall  : serviceCall,
  workflowPOST : workflowPOST,
  getJWTToken : getJWTToken,
  getDestinationUrl : getDestinationUrl
}
