class CreatePay {
  int? amount;
  String? currencyCode;
  String? merchantTransId;
  String? sellerUsername;
  String? paymentType;
  String? designation;
  String? webhookUrl;
  String? returnUrl;
  String? cancelUrl;
  String? customerRecipientNumber;
  String? customerEmail;
  String? customerFirstname;
  String? customerLastname;
  String? recipientPhotoUrl;

  CreatePay(
      {this.amount,
      this.currencyCode,
      this.merchantTransId,
      this.sellerUsername,
      this.paymentType,
      this.designation,
      this.webhookUrl,
      this.returnUrl,
      this.cancelUrl,
      this.customerRecipientNumber,
      this.customerEmail,
      this.customerFirstname,
      this.customerLastname,
      this.recipientPhotoUrl});

  CreatePay.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currencyCode = json['currency_code'];
    merchantTransId = json['merchant_trans_id'];
    sellerUsername = json['seller_username'];
    paymentType = json['payment_type'];
    designation = json['designation'];
    webhookUrl = json['webhook_url'];
    returnUrl = json['return_url'];
    cancelUrl = json['cancel_url'];
    customerRecipientNumber = json['customer_recipient_number'];
    customerEmail = json['customer_email'];
    customerFirstname = json['customer_firstname'];
    customerLastname = json['customer_lastname'];
    recipientPhotoUrl = json['recipient_photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency_code'] = currencyCode;
    data['merchant_trans_id'] = merchantTransId;
    data['seller_username'] = sellerUsername;
    data['payment_type'] = paymentType;
    data['designation'] = designation;
    data['webhook_url'] = webhookUrl;
    data['return_url'] = returnUrl;
    data['cancel_url'] = cancelUrl;
    data['customer_recipient_number'] = customerRecipientNumber;
    data['customer_email'] = customerEmail;
    data['customer_firstname'] = customerFirstname;
    data['customer_lastname'] = customerLastname;
    data['recipient_photo_url'] = recipientPhotoUrl;
    return data;
  }
}
