class InitiationInputs {
  String? type;
  String? name;
  String? label;
  bool? isRequired;
  String? placeholder;
  String? message;
  String? defaultDialingCode;

  InitiationInputs(
      {this.type,
      this.name,
      this.label,
      this.isRequired,
      this.placeholder,
      this.message,
      this.defaultDialingCode});

  InitiationInputs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    label = json['label'];
    isRequired = json['is_required'];
    placeholder = json['placeholder'];
    message = json['message'];
    defaultDialingCode = json['default_dialing_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['label'] = label;
    data['is_required'] = isRequired;
    data['placeholder'] = placeholder;
    data['message'] = message;
    data['default_dialing_code'] = defaultDialingCode;
    return data;
  }
}
