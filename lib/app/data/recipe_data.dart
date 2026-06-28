class RecipeData {
  String id = "";
  String image = "";
  String title = "";
  bool like = false;
  double rating = 0;
  int serving = 0;
  String preparation = "0 minutes";
  String description = "";
  String userID = "";
  String user = "";
  String userImage = "";
  String ingredients = "";
  String guide = "";

  RecipeData();

  RecipeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    like = json['like'];
    rating = json['rating'];
    serving = json['serving'];
    preparation = json['preparation'];
    description = json['description'];
    userID = json['userID'];
    user = json['user'];
    userImage = json['userImage'];
    ingredients = json['ingredients'];
    guide = json['guide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['title'] = title;
    data['like'] = like;
    data['rating'] = rating;
    data['serving'] = serving;
    data['preparation'] = preparation;
    data['description'] = description;
    data['userID'] = userID;
    data['user'] = user;
    data['userImage'] = userImage;
    data['ingredients'] = ingredients;
    data['guide'] = guide;
    return data;
  }
}
