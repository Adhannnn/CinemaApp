import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinema_application/models/listmovie.dart';

class Searchfieldpages extends StatefulWidget {
  const Searchfieldpages({super.key});

  @override
  State<Searchfieldpages> createState() => _SearhfieldpagesState();
}

class _SearhfieldpagesState extends State<Searchfieldpages> {
  final TextEditingController _controller = TextEditingController();
  bool _isEmptyText = true;
  List<AllMovie> allmovie = [];
  List<AllMovie> filteredMovies = []; // For storing filtered results

  @override
  void initState() {
    super.initState();

    // Safely initialize allmovie
    try {
      allmovie = AllMovie.getList();
    } catch (e) {
      // ignore: avoid_print
      print("Error initializing allmovie: $e");
      allmovie = [];
    }

    // Listen for changes in the search field
    _controller.addListener(() {
      final query = _controller.text.toLowerCase();
      final isEmptyNow = query.isEmpty;

      // Update filtered list based on the query
      if (!isEmptyNow) {
        filteredMovies = allmovie
            .where((movie) =>
                movie.moviename.toLowerCase().contains(query)) // Filter logic
            .toList();
      } else {
        filteredMovies = [];
      }

      if (isEmptyNow != _isEmptyText || !isEmptyNow) {
        setState(() {
          _isEmptyText = isEmptyNow;
        });
      }
    });
  }

  void toggleFav(AllMovie movie) {
    setState(() {
      movie.fav = !movie.fav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F0E0),
      appBar: appBar(context),
      body: _searchField(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffF5F0E0),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            width: 40,
            height: 50,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffEDBD50),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 3))
              ],
              border: Border.all(color: const Color(0xFF253C30), width: 3),
            ),
            child: SvgPicture.asset('assets/icon/arrow-back.svg')),
      ),
    );
  }

  Widget _searchField() {
    return Column(
      children: [
        // Search Field
        Container(
          margin:
              const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.11),
                blurRadius: 40,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Flexible(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: _isEmptyText ? 500 : 500,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: const Color.fromRGBO(236, 185, 75, 1),
                      contentPadding: const EdgeInsets.all(14),
                      suffixIcon: _isEmptyText
                          ? Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: SvgPicture.asset(
                                'assets/icon/Search.svg',
                                width: 5,
                                height: 5,
                              ),
                            )
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _controller.clear();
                                setState(() {
                                  filteredMovies = [];
                                });
                              },
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 6, 6, 6),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Show ListView only if there are filtered results
        if (filteredMovies.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                final movie = filteredMovies[index];

                return ListTile(
                  leading: Image.asset(
                    movie.images,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 200,
                  ),
                  title: Text(movie.moviename),
                  subtitle: Text('${movie.genre} | ${movie.rate}'),
                  trailing: IconButton(
                    icon: Icon(
                      movie.fav ? Icons.favorite : Icons.favorite_border,
                      color: movie.fav ? Colors.red : Colors.grey,
                    ),
                    onPressed: () => toggleFav(movie),
                  ),
                );
              },
            ),
          ),
        // Optionally, show a message when no results are found
        if (!_isEmptyText && filteredMovies.isEmpty)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'No movies found.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
