class AllMovie {
  String moviename;
  String images;
  String rate;
  String genre;

  AllMovie(
      {required this.moviename,
      required this.images,
      required this.rate,
      required this.genre});

  static List<AllMovie> getList() {
    List<AllMovie> listing = [];

    listing.add(AllMovie(
        moviename: 'Black Panther : \nWakanda Forever',
        images: 'assets/images/blackpanther.jpeg',
        rate: '5.0',
        genre: 'Action'));

    listing.add(AllMovie(
        moviename: 'Agak Laen',
        images: 'assets/images/spidermanposter.jpg',
        rate: '4.0',
        genre: 'Action'));

    listing.add(AllMovie(
        moviename: '13 Bom \ndi Jakarta',
        images: 'assets/images/13bomdijakarta.webp',
        rate: '4.0',
        genre: 'Action'));

    listing.add(AllMovie(
        moviename: 'Minions',
        images: 'assets/images/minionposter.jpg',
        rate: '4.9',
        genre: 'Animation'));

    return listing;
  }
}
