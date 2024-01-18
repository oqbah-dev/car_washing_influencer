class LoginModel {
  Influencer? influencer;
  String? token;

  LoginModel({this.influencer, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    influencer = json['influencer'] != null
        ? Influencer.fromJson(json['influencer'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (influencer != null) {
      data['influencer'] = influencer!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Influencer {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  int? isVerified;
  String? email;
  int? trash;
  String? influencerPicture;
  String? createdAt;
  String? updatedAt;

  Influencer(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.isVerified,
        this.email,
        this.trash,
        this.influencerPicture,
        this.createdAt,
        this.updatedAt});

  Influencer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    isVerified = json['isVerified'];
    email = json['email'];
    trash = json['trash'];
    influencerPicture = json['influencer_picture'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['isVerified'] = isVerified;
    data['email'] = email;
    data['trash'] = trash;
    data['influencer_picture'] = influencerPicture;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
