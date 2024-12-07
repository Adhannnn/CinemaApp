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

    addMovie.add(Listallmovie(
        pathImage: 'assets/images/minionsposter.jpg', title: 'Minions'));

    addMovie.add(Listallmovie(
        pathImage: 'assets/images/aadc2poster.jpg', title: 'AADC 2'));
    return addMovie;
  }
}
