import 'package:adjemin_pay/data/models/payement/seller.dart';

class Payement {
  String? gatewayOperatorCode;
  String? gatewayCode;
  int? amount;
  String? currencyCode;
  String? recipientNumber;
  String? recipientName;
  String? recipientEmail;
  String? recipientPhotoUrl;
  String? designation;
  String? status;
  String? gatewayTransId;
  String? fees;
  String? merchantTransId;
  String? merchantTransData;
  String? webhookUrl;
  String? returnUrl;
  String? cancelUrl;
  bool? isPayin;
  String? responseStatusCode;
  bool? isWaiting;
  bool? isCompleted;
  String? sellerUsername;
  String? paymentType;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? gatewayPaymentUrl;
  Seller? seller;

  Payement(
      {this.gatewayOperatorCode,
      this.gatewayCode,
      this.amount,
      this.currencyCode,
      this.recipientNumber,
      this.recipientName,
      this.recipientEmail,
      this.recipientPhotoUrl,
      this.designation,
      this.status,
      this.gatewayTransId,
      this.fees,
      this.merchantTransId,
      this.merchantTransData,
      this.webhookUrl,
      this.returnUrl,
      this.cancelUrl,
      this.isPayin,
      this.responseStatusCode,
      this.isWaiting,
      this.isCompleted,
      this.sellerUsername,
      this.paymentType,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.gatewayPaymentUrl,
      this.seller});

  Payement.fromJson(Map<String, dynamic> json) {
    gatewayOperatorCode = json['gateway_operator_code'];
    gatewayCode = json['gateway_code'];
    amount = json['amount'];
    currencyCode = json['currency_code'];
    recipientNumber = json['recipient_number'];
    recipientName = json['recipient_name'];
    recipientEmail = json['recipient_email'];
    recipientPhotoUrl = json['recipient_photo_url'];
    designation = json['designation'];
    status = json['status'];
    gatewayTransId = json['gateway_trans_id'];
    fees = json['fees'];
    merchantTransId = json['merchant_trans_id'];
    merchantTransData = json['merchant_trans_data'];
    webhookUrl = json['webhook_url'];
    returnUrl = json['return_url'];
    cancelUrl = json['cancel_url'];
    isPayin = json['is_payin'];
    responseStatusCode = json['response_status_code'];
    isWaiting = json['is_waiting'];
    isCompleted = json['is_completed'];
    sellerUsername = json['seller_username'];
    paymentType = json['payment_type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    gatewayPaymentUrl = json['gateway_payment_url'];
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gateway_operator_code'] = gatewayOperatorCode;
    data['gateway_code'] = gatewayCode;
    data['amount'] = amount;
    data['currency_code'] = currencyCode;
    data['recipient_number'] = recipientNumber;
    data['recipient_name'] = recipientName;
    data['recipient_email'] = recipientEmail;
    data['recipient_photo_url'] = recipientPhotoUrl;
    data['designation'] = designation;
    data['status'] = status;
    data['gateway_trans_id'] = gatewayTransId;
    data['fees'] = fees;
    data['merchant_trans_id'] = merchantTransId;
    data['merchant_trans_data'] = merchantTransData;
    data['webhook_url'] = webhookUrl;
    data['return_url'] = returnUrl;
    data['cancel_url'] = cancelUrl;
    data['is_payin'] = isPayin;
    data['response_status_code'] = responseStatusCode;
    data['is_waiting'] = isWaiting;
    data['is_completed'] = isCompleted;
    data['seller_username'] = sellerUsername;
    data['payment_type'] = paymentType;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['gateway_payment_url'] = gatewayPaymentUrl;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    return data;
  }
}
