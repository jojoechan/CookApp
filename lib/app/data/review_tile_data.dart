class ReviewTileData {
    String id = "";
    String user = "";
    String userImage = "";
    double rating = 0;
    String review = "";
    String date = "";

    ReviewTileData({
      required this.id, 
      required this.user, 
      required this.userImage, 
      required this.rating, 
      required this.review,
      required this.date
    }); 

    ReviewTileData.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        user = json['user'];
        userImage = json['userImage'];
        rating = json['rating'];
        review = json['guide'];
        review = json['date'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['user'] = user;
        data['userImage'] = userImage;
        data['rating'] = rating;
        data['review'] = review;
        data['date'] = date;
        return data;
    }
}

