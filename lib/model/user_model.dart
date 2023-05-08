class UserModel {
  UserModel({
    this.name,
    this.email,
    this.uid,
    this.password,
    this.userid,

  });

  UserModel.fromJson(String mId, dynamic json) {
    print(">>>>> User >>>> $mId");
    name = json['name'];
    email = json['email'];
    uid = mId;
    password = json['password'];
    userid = json['userid'];
  }

  String? name;
  String? email;
  String? uid;
  String? password;
  String? userid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['uid'] = uid;
    map['password'] = password;
    map['userid'] = userid;
    return map;
  }
}
