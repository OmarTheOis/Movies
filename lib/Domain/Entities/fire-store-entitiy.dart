class FireStoreEntity {
  int id;
  String name;
  String year;
  String image;
  String backDrop;
  String description;
  bool? state =false;
  double rate;
  List<dynamic> categories;


    FireStoreEntity({
    required this.id,
    required this.rate,
    required this.name,
    required this.year,
    required this.image,
    required this.backDrop,
    required this.description,
    required this.state,
    required this.categories});
}