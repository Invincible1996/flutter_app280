///
/// @date: 2021/12/20 15:31
/// @author: kevin
/// @description: dart
class UserEntry {
  String? code;
  Data? data;
  String? message;
  UserEntry({
    this.code,
    this.data,
    this.message,
  });
  UserEntry.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['code'] = code;
    if (data != null) {
      dataMap['data'] = data?.toJson();
    }
    dataMap['message'] = message;
    return dataMap;
  }
}

class Data {
  String? token;
  UserDetail? userDetail;
  Data({
    this.token,
    this.userDetail,
  });
  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userDetail = json['userDetail'] != null ? UserDetail.fromJson(json['userDetail']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['token'] = token;
    if (userDetail != null) {
      dataMap['userDetail'] = userDetail?.toJson();
    }
    return dataMap;
  }
}

class UserDetail {
  String? username;
  bool? accountNonExpired;
  bool? accountNonLocked;
  bool? credentialsNonExpired;
  bool? enabled;
  List<dynamic>? authorities;
  // String? privileges;
  String? userType;
  String? userUid;
  String? realName;
  int? titleId;
  String? countryCode;
  String? phone;
  List<Identities>? identities;
  UserDetail({
    this.username,
    this.accountNonExpired,
    this.accountNonLocked,
    this.credentialsNonExpired,
    this.enabled,
    this.authorities,
    // this.privileges,
    this.userType,
    this.userUid,
    this.realName,
    this.titleId,
    this.countryCode,
    this.phone,
    this.identities,
  });
  UserDetail.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    accountNonExpired = json['accountNonExpired'];
    accountNonLocked = json['accountNonLocked'];
    credentialsNonExpired = json['credentialsNonExpired'];
    enabled = json['enabled'];
    authorities = json['authorities'];
    // privileges = json['privileges'];
    userType = json['userType'];
    userUid = json['userUid'];
    realName = json['realName'];
    titleId = json['titleId'];
    countryCode = json['countryCode'];
    phone = json['phone'];
    if (json['identities'] != null) {
      identities = <Identities>[];
      json['identities'].forEach((v) {
        identities?.add(Identities.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['username'] = username;
    dataMap['accountNonExpired'] = accountNonExpired;
    dataMap['accountNonLocked'] = accountNonLocked;
    dataMap['credentialsNonExpired'] = credentialsNonExpired;
    dataMap['enabled'] = enabled;
    dataMap['authorities'] = authorities;
    // dataMap['privileges'] = privileges;
    dataMap['userType'] = userType;
    dataMap['userUid'] = userUid;
    dataMap['realName'] = realName;
    dataMap['titleId'] = titleId;
    dataMap['countryCode'] = countryCode;
    dataMap['phone'] = phone;
    return dataMap;
  }
}

class Identities {
  String? userType;
  String? userUid;
  String? realName;
  Identities({
    this.userType,
    this.userUid,
    this.realName,
  });
  Identities.fromJson(Map<String, dynamic> json) {
    userType = json['userType'];
    userUid = json['userUid'];
    realName = json['realName'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['userType'] = userType;
    dataMap['userUid'] = userUid;
    dataMap['realName'] = realName;
    return dataMap;
  }
}
