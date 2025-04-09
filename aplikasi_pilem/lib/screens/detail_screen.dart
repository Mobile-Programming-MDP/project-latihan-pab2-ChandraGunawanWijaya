import 'dart:convert';

import 'package:aplikasi_pilem/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final Movie movie;
  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIsFavorite();
  }

  Future<void> _checkIsFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isFavorite = prefs.containsKey('movie_${widget.movie.id}');
    });
  }
Future<void> _toggleFavorite() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final String key = 'movie_${widget.movie.id}';

  setState(() {
    _isFavorite = !_isFavorite;
  });

  if (_isFavorite) {
    final String movieJson = jsonEncode(widget.movie.toJson());
    prefs.setString(key, movieJson);

    List<String> favoriteMovieIds = prefs.getStringList('favoriteMovies') ?? [];
    if (!favoriteMovieIds.contains(widget.movie.id.toString())) {
      favoriteMovieIds.add(widget.movie.id.toString());
      prefs.setStringList('favoriteMovies', favoriteMovieIds);
    }
  } else {
    prefs.remove(key);

    List<String> favoriteMovieIds = prefs.getStringList('favoriteMovies') ?? [];
    favoriteMovieIds.remove(widget.movie.id.toString());
    prefs.setStringList('favoriteMovies', favoriteMovieIds);
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${widget.movie.posterPath}',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: _toggleFavorite,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Overview',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.movie.overview,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Release Date : ',
                    style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    widget.movie.releaseDate,
                    style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color:  Colors.amber,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Rating : ${widget.movie.voteAverage}',
                        style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
