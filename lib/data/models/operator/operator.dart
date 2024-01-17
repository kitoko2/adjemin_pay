import 'package:adjemin_pay/data/models/operator/initiation_input.dart';

class Operator {
  int? id;
  String? name;
  String? payinCode;
  String? payoutCode;
  String? countryCode;
  String? currencyCode;
  bool? isActivePayin;
  bool? isActivePayout;
  String? image;
  String? payinFees;
  String? payinMode;
  String? payoutFees;
  String? payoutMode;
  String? gatewayCode;
  List<InitiationInputs>? initiationInputs;
  bool? isRequireApproval;
  String? approvalMessage;
  bool? hasPaymentUrlRedirection;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Operator(
      {this.id,
      this.name,
      this.payinCode,
      this.payoutCode,
      this.countryCode,
      this.currencyCode,
      this.isActivePayin,
      this.isActivePayout,
      this.image,
      this.payinFees,
      this.payinMode,
      this.payoutFees,
      this.payoutMode,
      this.gatewayCode,
      this.initiationInputs,
      this.isRequireApproval,
      this.approvalMessage,
      this.hasPaymentUrlRedirection,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Operator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    payinCode = json['payin_code'];
    payoutCode = json['payout_code'];
    countryCode = json['country_code'];
    currencyCode = json['currency_code'];
    isActivePayin = json['is_active_payin'];
    isActivePayout = json['is_active_payout'];
    image = json['image'];
    payinFees = json['payin_fees'];
    payinMode = json['payin_mode'];
    payoutFees = json['payout_fees'];
    payoutMode = json['payout_mode'];
    gatewayCode = json['gateway_code'];
    if (json['initiation_inputs'] != null) {
      initiationInputs = <InitiationInputs>[];
      json['initiation_inputs'].forEach((v) {
        initiationInputs!.add(InitiationInputs.fromJson(v));
      });
    }
    isRequireApproval = json['is_require_approval'];
    approvalMessage = json['approval_message'];
    hasPaymentUrlRedirection = json['has_payment_url_redirection'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['payin_code'] = payinCode;
    data['payout_code'] = payoutCode;
    data['country_code'] = countryCode;
    data['currency_code'] = currencyCode;
    data['is_active_payin'] = isActivePayin;
    data['is_active_payout'] = isActivePayout;
    data['image'] = image;
    data['payin_fees'] = payinFees;
    data['payin_mode'] = payinMode;
    data['payout_fees'] = payoutFees;
    data['payout_mode'] = payoutMode;
    data['gateway_code'] = gatewayCode;
    if (initiationInputs != null) {
      data['initiation_inputs'] =
          initiationInputs!.map((v) => v.toJson()).toList();
    }
    data['is_require_approval'] = isRequireApproval;
    data['approval_message'] = approvalMessage;
    data['has_payment_url_redirection'] = hasPaymentUrlRedirection;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
