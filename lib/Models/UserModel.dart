import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  String? uid;
  String? fname;
  String? lname;
  String? erp_no;
  String? profilePic;
  int? marks;
  Map<String, dynamic>? otherdata;
  UserModel({
    this.uid,
    this.fname,
    this.lname,
    this.erp_no,
    this.profilePic,
    this.marks,
    this.otherdata,
  });

  UserModel copyWith({
    String? uid,
    String? fname,
    String? lname,
    String? erp_no,
    String? profilePic,
    int? marks,
    Map<String, dynamic>? otherdata,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      erp_no: erp_no ?? this.erp_no,
      profilePic: profilePic ?? this.profilePic,
      marks: marks ?? this.marks,
      otherdata: otherdata ?? this.otherdata,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'fname': fname,
      'lname': lname,
      'erp_no': erp_no,
      'profilePic': profilePic,
      'marks': marks,
      'otherdata': otherdata,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      fname: map['fname'],
      lname: map['lname'],
      erp_no: map['erp_no'],
      profilePic: map['profilePic'],
      marks: map['marks']?.toInt(),
      otherdata: Map<String, dynamic>.from(map['otherdata']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(uid: $uid, fname: $fname, lname: $lname, erp_no: $erp_no, profilePic: $profilePic, marks: $marks, otherdata: $otherdata)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.uid == uid &&
      other.fname == fname &&
      other.lname == lname &&
      other.erp_no == erp_no &&
      other.profilePic == profilePic &&
      other.marks == marks &&
      mapEquals(other.otherdata, otherdata);
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      erp_no.hashCode ^
      profilePic.hashCode ^
      marks.hashCode ^
      otherdata.hashCode;
  }
}
