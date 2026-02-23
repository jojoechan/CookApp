class RecipeTileData {
    String id = "";
    String image = "";
    String title = "";
    bool like = false;
    int serving = 0;
    String preparation = "0 minutes";
    bool isChoosed = false;

    RecipeTileData({
      required this.id, 
      required this.image, 
      required this.title, 
      required this.like, 
      required this.serving, 
      required this.preparation
    }); 

    RecipeTileData.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        image = json['image'];
        title = json['title'];
        like = json['like'];
        serving = json['serving'];
        preparation = json['preparation'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['image'] = image;
        data['title'] = title;
        data['like'] = like;
        data['serving'] = serving;
        data['preparation'] = preparation;
        return data;
    }
}

