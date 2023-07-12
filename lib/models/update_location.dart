import 'package:bootcamp_starter/models/r_user.dart';


class update_location {
  R_User? user;

  update_location({this.user});

  update_location.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new R_User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
