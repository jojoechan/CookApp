class UserData {
  String userID = "";
  String user = "";
  String userImage = "";

  UserData();

  UserData.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    user = json['user'];
    userImage = json['userImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['user'] = user;
    data['userImage'] = userImage;
    return data;
  }
}
