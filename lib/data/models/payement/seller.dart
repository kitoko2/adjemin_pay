class Seller {
  String? photoUrl;
  String? name;

  Seller({this.photoUrl, this.name});

  Seller.fromJson(Map<String, dynamic> json) {
    photoUrl = json['photo_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['photo_url'] = photoUrl;
    data['name'] = name;
    return data;
  }
}
