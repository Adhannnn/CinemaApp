class Listallmovie {
  String pathImage;
  String title;

  Listallmovie({required this.pathImage, required this.title});

  static List<Listallmovie> getMovie() {
    List<Listallmovie> addMovie = [];

    addMovie.add(Listallmovie(
        pathImage: 'assets/images/spidermanposter.jpg',
        title: "Spider-Man No \nWay Home"));

    addMovie.add(Listallmovie(
        pathImage: 'assets/images/agaklaen.jpg', title: "Agak Laen"));
    return addMovie;
  }
}
