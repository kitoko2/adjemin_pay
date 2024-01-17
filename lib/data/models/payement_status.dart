import 'package:adjemin_pay/data/models/payement/seller.dart';

class PayementStatus {
  int? id;
  String? gatewayOperatorCode;
  String? gatewayCode;
  int? amount;
  String? currencyCode;
  String? recipientNumber;
  String? recipientName;
  String? recipientEmail;
  String? recipientPhotoUrl;
  String? designation;
  Status? status;
  String? gatewayTransId;
  String? fees;
  String? merchantTransId;
  String? merchantTransData;
  bool? isPayin;
  int? responseStatusCode;
  String? failureReason;
  String? paymentUrl;
  String? webhookUrl;
  String? returnUrl;
  String? cancelUrl;
  bool? isWaiting;
  bool? isCompleted;
  String? sellerUsername;
  String? gatewayPaymentUrl;
  String? paymentType;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Seller? seller;

  PayementStatus(
      {this.id,
      this.gatewayOperatorCode,
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
      this.isPayin,
      this.responseStatusCode,
      this.failureReason,
      this.paymentUrl,
      this.webhookUrl,
      this.returnUrl,
      this.cancelUrl,
      this.isWaiting,
      this.isCompleted,
      this.sellerUsername,
      this.gatewayPaymentUrl,
      this.paymentType,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.seller});

  PayementStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gatewayOperatorCode = json['gateway_operator_code'];
    gatewayCode = json['gateway_code'];
    amount = json['amount'];
    currencyCode = json['currency_code'];
    recipientNumber = json['recipient_number'];
    recipientName = json['recipient_name'];
    recipientEmail = json['recipient_email'];
    recipientPhotoUrl = json['recipient_photo_url'];
    designation = json['designation'];
    status = stringToStatus(json['status']);
    gatewayTransId = json['gateway_trans_id'];
    fees = json['fees'];
    merchantTransId = json['merchant_trans_id'];
    merchantTransData = json['merchant_trans_data'];
    isPayin = json['is_payin'];
    responseStatusCode = json['response_status_code'];
    failureReason = json['failure_reason'];
    paymentUrl = json['payment_url'];
    webhookUrl = json['webhook_url'];
    returnUrl = json['return_url'];
    cancelUrl = json['cancel_url'];
    isWaiting = json['is_waiting'];
    isCompleted = json['is_completed'];
    sellerUsername = json['seller_username'];
    gatewayPaymentUrl = json['gateway_payment_url'];
    paymentType = json['payment_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    seller = json['seller'] != null ? Seller.fromJson(json['seller']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gateway_operator_code'] = gatewayOperatorCode;
    data['gateway_code'] = gatewayCode;
    data['amount'] = amount;
    data['currency_code'] = currencyCode;
    data['recipient_number'] = recipientNumber;
    data['recipient_name'] = recipientName;
    data['recipient_email'] = recipientEmail;
    data['recipient_photo_url'] = recipientPhotoUrl;
    data['designation'] = designation;
    data['status'] = statusToString(status);
    data['gateway_trans_id'] = gatewayTransId;
    data['fees'] = fees;
    data['merchant_trans_id'] = merchantTransId;
    data['merchant_trans_data'] = merchantTransData;
    data['is_payin'] = isPayin;
    data['response_status_code'] = responseStatusCode;
    data['failure_reason'] = failureReason;
    data['payment_url'] = paymentUrl;
    data['webhook_url'] = webhookUrl;
    data['return_url'] = returnUrl;
    data['cancel_url'] = cancelUrl;
    data['is_waiting'] = isWaiting;
    data['is_completed'] = isCompleted;
    data['seller_username'] = sellerUsername;
    data['gateway_payment_url'] = gatewayPaymentUrl;
    data['payment_type'] = paymentType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (seller != null) {
      data['seller'] = seller!.toJson();
    }
    return data;
  }

  Status? stringToStatus(String? value) {
    switch (value) {
      case 'INITIATED':
        return Status.initiated;
      case 'PENDING':
        return Status.pending;
      case 'SUCCESSFUL':
        return Status.successful;
      case 'FAILED':
        return Status.failed;
      default:
        return null;
    }
  }

  String? statusToString(Status? value) {
    switch (value) {
      case Status.initiated:
        return 'INITIATED';
      case Status.pending:
        return 'PENDING';
      case Status.successful:
        return 'SUCCESSFUL';
      case Status.failed:
        return 'FAILED';
      default:
        return null;
    }
  }
}

enum Status { initiated, pending, successful, failed }
