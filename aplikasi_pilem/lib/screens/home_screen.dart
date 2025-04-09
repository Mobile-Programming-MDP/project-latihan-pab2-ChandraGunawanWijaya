import 'package:flutter/material.dart';
import 'package:aplikasi_pilem/models/movie.dart';
import 'package:aplikasi_pilem/services/api_service.dart';

import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();

  List<Movie> _allMovie = [];
  List<Movie> _trendingMovie = [];
  List<Movie> _popularMovie = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async{
    final List<Map<String, dynamic>> allMoviesData = await _apiService.getAllMovies();
    final List<Map<String, dynamic>> trendingMoviesData = await _apiService.getTrendingMovies();
    final List<Map<String, dynamic>> popularMoviesData = await _apiService.getPopularMovies();

    setState(() {
      _allMovie = allMoviesData.map((e) => Movie.fromJson(e)).toList();
      _trendingMovie = trendingMoviesData.map((e) => Movie.fromJson(e)).toList();
      _popularMovie = popularMoviesData.map((e) => Movie.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMoviesList('All Movies', _allMovie),
            _buildMoviesList('Trending Movies', _trendingMovie),
            _buildMoviesList('Popular Movies', _popularMovie),
          ],
        ),
      ),
    );
  }

  Widget _buildMoviesList (String title, List<Movie>movies){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index){
              final Movie movie = movies[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(movie: movie),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                        width: 120,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        movie.title.length > 14 ? '${movie.title.substring(0, 14)}...' : movie.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ), 
                      )
                    ],
                  ),
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}