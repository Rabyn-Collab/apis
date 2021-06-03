class Camera {
  final int id;
  final String name;

  Camera({this.name, this.id});

  factory Camera.fromJson(Map<String, dynamic> json){
    return Camera(
        name: json['full_name'],
        id: json['id']
    );
  }

}



class Nasa {
  final String imgUrl;
  Camera camera;

  Nasa({this.camera, this.imgUrl});

  factory Nasa.fromJson(Map<String, dynamic> json){
    return Nasa(
        camera: json['camera'] != null ? Camera.fromJson(json['camera']) : null,
        imgUrl: json['img_src']
    );
  }
}