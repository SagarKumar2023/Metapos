class RegisterModel {
  String? error;
  User? user;

  RegisterModel({this.error, this.user});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? email;
  String? typeReg;
  String? name;
  String? password;
  int? role;
  int? verifyOtp;
  int? restaurantId;
  int? ownerId;
  String? phone;
  int? otp;
  String? updatedAt;
  String? createdAt;
  int? id;

  User(
      {this.email,
        this.typeReg,
        this.name,
        this.password,
        this.role,
        this.verifyOtp,
        this.restaurantId,
        this.ownerId,
        this.phone,
        this.otp,
        this.updatedAt,
        this.createdAt,
        this.id});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    typeReg = json['typeReg'];
    name = json['name'];
    password = json['password'];
    role = json['role'];
    verifyOtp = json['verify_otp'];
    restaurantId = json['restaurant_id'];
    ownerId = json['owner_id'];
    phone = json['phone'];
    otp = json['otp'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['typeReg'] = this.typeReg;
    data['name'] = this.name;
    data['password'] = this.password;
    data['role'] = this.role;
    data['verify_otp'] = this.verifyOtp;
    data['restaurant_id'] = this.restaurantId;
    data['owner_id'] = this.ownerId;
    data['phone'] = this.phone;
    data['otp'] = this.otp;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
