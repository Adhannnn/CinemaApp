class AllMovie {
  String moviename;
  String images;
  String rate;
  String genre;
  String time;
  String rating;

  AllMovie(
      {required this.moviename,
      required this.images,
      required this.rate,
      required this.genre,
      required this.time,
      required this.rating});

  static List<AllMovie> getList() {
    List<AllMovie> listing = [];

    listing.add(AllMovie(
        moviename: 'Black Panther : \nWakanda Forever',
        images: 'assets/images/blackpanther.jpeg',
        rate: '5.0',
        genre: 'Action',
        time: '161',
        rating: 'PG-13'));

    listing.add(AllMovie(
        moviename: 'Spiderman : \nNo Way Home',
        images: 'assets/images/spidermanposter.jpg',
        rate: '4.0',
        genre: 'Action',
        time: '119',
        rating: 'PG-13'));

    listing.add(AllMovie(
        moviename: '13 Bom \ndi Jakarta',
        images: 'assets/images/13bomdijakarta.webp',
        rate: '4.0',
        genre: 'Action',
        time: '143',
        rating: 'PG-13'));

    listing.add(AllMovie(
        moviename: 'Minions',
        images: 'assets/images/minionsposter.jpg',
        rate: '4.9',
        genre: 'Animation',
        time: '88',
        rating: 'PG-13'));

    return listing;
  }
}
