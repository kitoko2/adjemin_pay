class Constant {
  static const grantType = 'client_credentials';
  static const rootUrl = 'https://api.adjem.in/v3/';
  // static const rootUrl = 'https://api-test.adjem.in/v3/';

  //--------------------URLS API-------------------------
  static const urlMerchantAccesToken = 'oauth/token';
  static const urlCreatePayement = 'gateway/merchants/create_payment';
  static const urlGetPayement = 'gateway/merchants/get_payment/';
  static const urlGetOperatorByCountry = 'gateway/operators/';
  static const urlMakePayement = 'gateway/merchants/make_payment';
  static const urlGetPayementStatus = 'gateway/merchants/payment/';
}
