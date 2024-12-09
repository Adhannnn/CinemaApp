class AllMovie {
  String moviename;
  String images;
  String rate;
  String genre;
  String time;
  String rating;
  String synopsis;
  String years;

  AllMovie(
      {required this.moviename,
      required this.images,
      required this.rate,
      required this.genre,
      required this.time,
      required this.rating,
      required this.synopsis,
      required this.years});

  static List<AllMovie> getList() {
    List<AllMovie> listing = [];

    listing.add(AllMovie(
        moviename: 'Black Panther : \nWakanda Forever',
        images: 'assets/images/blackpanther.jpeg',
        rate: '5.0',
        genre: 'Action',
        time: '161',
        rating: 'PG-13',
        synopsis:
            "As the new King of Wakanda, T’Challa (Chadwick Boseman) is still grappling with his feelings about the death of his father, T’Chaka. (John Kani). However, he then decided to continue his father's struggle. When Wakanda is threatened by two dangerous enemies that could jeopardize the safety of the nation, Black Panther strives to prove himself as the true king of Wakanda. He must use his new suit and strength to defend Wakanda and other nations.",
        years: '2022'));

    listing.add(AllMovie(
        moviename: 'Spiderman : \nNo Way Home',
        images: 'assets/images/spidermanposter.jpg',
        rate: '4.0',
        genre: 'Action',
        time: '119',
        rating: 'PG-13',
        synopsis:
            "For the first time in Spider-Man's cinematic history, the true identity of this friendly neighborhood hero is revealed, causing his responsibilities as a super-powered individual to clash with his normal life, and putting all his closest loved ones in the most threatened position.",
        years: '2021'));

    listing.add(AllMovie(
        moviename: '13 Bom \ndi Jakarta',
        images: 'assets/images/13bomdijakarta.webp',
        rate: '4.0',
        genre: 'Action',
        time: '143',
        rating: 'PG-13',
        synopsis:
            "A group of terrorists attempted to wreak havoc in Jakarta, the capital of Indonesia, with bomb attacks at thirteen different locations. The security forces, who were aware of the plan, tried to act quickly to prevent any casualties.",
        years: '2023'));

    listing.add(AllMovie(
        moviename: 'Minions',
        images: 'assets/images/minionsposter.jpg',
        rate: '4.9',
        genre: 'Animation',
        time: '88',
        rating: 'PG-13',
        synopsis:
            "Otto managed to save Gru, who used the stone to turn the Vicious 6 into mice. The Vicious 6 were captured, including Knuckles, who was taken to the hospital and died from his injuries. At Knuckles' funeral, Gru delivered a heartfelt tribute speech, but it was revealed that Knuckles had faked his death.",
        years: '2024'));

    return listing;
  }
}
