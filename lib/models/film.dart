class MovieList {
  String images;
  String nameMovie;
  String date;

  MovieList({
    required this.images,
    required this.nameMovie,
    required this.date,
  });

  // data
  static List<MovieList> getList() {
    List<MovieList> firstlist = [];

    firstlist.add(MovieList(
        images: 'assets/images/blackpanther.jpeg',
        nameMovie: 'Black Panther : \nWakanda Forever',
        date: 'On March 2, 2022'));

    firstlist.add(MovieList(
        images: 'assets/images/spiderman.jpg',
        nameMovie: 'Spider-Man No Way Home',
        date: 'On December 15, 2021'));

    firstlist.add(MovieList(
        images: 'assets/images/agaklaen.jpg',
        nameMovie: 'Agak Laen',
        date: '1 February 2024'));

    return firstlist;
  }
}
