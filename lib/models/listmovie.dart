class AllMovie {
  String moviename;
  String images;
  String rate;
  String genre;
  String times;
  bool fav;

  AllMovie(
      {required this.moviename,
      required this.images,
      required this.rate,
      required this.genre,
      required this.times,
      this.fav = false});

  static List<AllMovie> getList() {
    List<AllMovie> listing = [];

    listing.add(AllMovie(
        moviename: 'Black Panther : \nWakanda Forever',
        images: 'assets/images/blackpanther.jpeg',
        rate: '5.0',
        genre: 'Action',
        times: '161 Min',
        fav: false));

    listing.add(AllMovie(
        moviename: 'Agak Laen',
        images: 'assets/images/spidermanposter.jpg',
        rate: '4.0',
        genre: 'Action',
        times: '119 Min',
        fav: false));

    listing.add(AllMovie(
        moviename: '13 Bom \ndi Jakarta',
        images: 'assets/images/13bomdijakarta.webp',
        rate: '4.0',
        genre: 'Action',
        times: '143 Min',
        fav: false));

    listing.add(AllMovie(
        moviename: 'Minions : \nThe Rise of Gru',
        images: 'assets/images/minionsposter.jpg',
        rate: '4.9',
        genre: 'Animation',
        times: '88 Min',
        fav: false));

    listing.add(AllMovie(
        moviename: 'Ada Apa Dengan \nCinta 2',
        images: 'assets/images/aadc2poster.jpg',
        rate: '4.1',
        genre: 'Drama',
        times: '123 Min',
        fav: false));

    return listing;
  }
}
