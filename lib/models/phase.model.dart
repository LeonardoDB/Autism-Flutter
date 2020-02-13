class PhaseModel {
  int id;
  String imageBackground;
  List<Images> images;

  PhaseModel({this.id, this.imageBackground, this.images});

  PhaseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageBackground = json['imageBackground'];
    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageBackground'] = this.imageBackground;
    if (this.images != null) {
      data['images'] = this.images.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String imageName;
  String imagePlacePath;
  String imageSocketPath;
  int imageHeight;
  int imageWidth;
  bool accept;
  int imagePlaceDx;
  int imagePlaceDy;
  int imageSocketDx;
  int imageSocketDy;

  Images(
      {this.imageName,
      this.imagePlacePath,
      this.imageSocketPath,
      this.imageHeight,
      this.imageWidth,
      this.accept,
      this.imagePlaceDx,
      this.imagePlaceDy,
      this.imageSocketDx,
      this.imageSocketDy});

  Images.fromJson(Map<String, dynamic> json) {
    imageName = json['imageName'];
    imagePlacePath = json['imagePlacePath'];
    imageSocketPath = json['imageSocketPath'];
    imageHeight = json['imageHeight'];
    imageWidth = json['imageWidth'];
    accept = json['accept'];
    imagePlaceDx = json['imagePlaceDx'];
    imagePlaceDy = json['imagePlaceDy'];
    imageSocketDx = json['imageSocketDx'];
    imageSocketDy = json['imageSocketDy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageName'] = this.imageName;
    data['imagePlacePath'] = this.imagePlacePath;
    data['imageSocketPath'] = this.imageSocketPath;
    data['imageHeight'] = this.imageHeight;
    data['imageWidth'] = this.imageWidth;
    data['accept'] = this.accept;
    data['imagePlaceDx'] = this.imagePlaceDx;
    data['imagePlaceDy'] = this.imagePlaceDy;
    data['imageSocketDx'] = this.imageSocketDx;
    data['imageSocketDy'] = this.imageSocketDy;
    return data;
  }
}
