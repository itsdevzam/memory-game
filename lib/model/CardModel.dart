class CardModel {
  String? image;
  bool? isMatch;
  bool? isFlip;

  CardModel({this.image, this.isMatch, this.isFlip});

  CardModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    isMatch = json['isMatch'];
    isFlip = json['isFlip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['isMatch'] = this.isMatch;
    data['isFlip'] = this.isFlip;
    return data;
  }
}