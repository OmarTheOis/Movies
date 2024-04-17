class PopularEntity{
  int id;
  bool? state;
  String backDrop;
  String poster;
  String title;
  String overview;
  double voteAverage;
  String date;
  var categories;

  changeState(){
    state = true;
  }

  PopularEntity(
      {
        required this.id,
        this.state,
        this.categories,
        required this.backDrop,
        required this.poster,
        required this.title,
        required this.overview,
        required this.voteAverage,
        required this.date
      });
}