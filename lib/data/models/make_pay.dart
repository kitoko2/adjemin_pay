class MakePay {
  int? amount;
  String? gatewayOperatorCode;
  String? merchantTransId;
  String? customerRecipientNumber;
  String? customerEmail;
  String? customerFirstname;
  String? customerLastname;
  String? otp;
  String? webhookUrl;
  String? returnUrl;
  String? cancelUrl;

  MakePay(
      {this.amount,
      this.gatewayOperatorCode,
      this.merchantTransId,
      this.customerRecipientNumber,
      this.customerEmail,
      this.customerFirstname,
      this.customerLastname,
      this.otp,
      this.webhookUrl,
      this.returnUrl,
      this.cancelUrl});

  MakePay.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    gatewayOperatorCode = json['gateway_operator_code'];
    merchantTransId = json['merchant_trans_id'];
    customerRecipientNumber = json['customer_recipient_number'];
    customerEmail = json['customer_email'];
    customerFirstname = json['customer_firstname'];
    customerLastname = json['customer_lastname'];
    otp = json['otp'];
    webhookUrl = json['webhook_url'];
    returnUrl = json['return_url'];
    cancelUrl = json['cancel_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['gateway_operator_code'] = gatewayOperatorCode;
    data['merchant_trans_id'] = merchantTransId;
    data['customer_recipient_number'] = customerRecipientNumber;
    data['customer_email'] = customerEmail;
    data['customer_firstname'] = customerFirstname;
    data['customer_lastname'] = customerLastname;
    data['otp'] = otp;
    data['webhook_url'] = webhookUrl;
    data['return_url'] = returnUrl;
    data['cancel_url'] = cancelUrl;
    return data;
  }
}
