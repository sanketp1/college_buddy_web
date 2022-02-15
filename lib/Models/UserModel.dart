import 'dart:convert';

class UserModel {
  String? fname;
  String? lname;
  String? profilePic;
  String? erp_no;
  UserModel({
    this.fname,
    this.lname,
    this.profilePic,
    this.erp_no,
  });

  UserModel copyWith({
    String? fname,
    String? lname,
    String? profilePic,
    String? erp_no,
  }) {
    return UserModel(
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      profilePic: profilePic ?? this.profilePic,
      erp_no: erp_no ?? this.erp_no,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fname': fname,
      'lname': lname,
      'profilePic': profilePic,
      'erp_no': erp_no,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fname: map['fname'],
      lname: map['lname'],
      profilePic: map['profilePic'],
      erp_no: map['erp_no'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(fname: $fname, lname: $lname, profilePic: $profilePic, erp_no: $erp_no)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.fname == fname &&
        other.lname == lname &&
        other.profilePic == profilePic &&
        other.erp_no == erp_no;
  }

  @override
  int get hashCode {
    return fname.hashCode ^
        lname.hashCode ^
        profilePic.hashCode ^
        erp_no.hashCode;
  }
}
