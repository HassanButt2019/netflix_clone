


import 'package:netflix/src/models/image_model.dart';
import 'package:netflix/src/models/item_model.dart';
import 'package:netflix/src/models/movie_detail_model.dart';
import 'package:netflix/src/models/movie_image_model.dart';
import 'package:netflix/src/resources/movie_api.dart';

class Repository{
  final moviesApiProvider = MovieProvider();
  Future<MovieDetailModel> fetchMovieDetail(int movieId) =>moviesApiProvider.fetchMovieDetail(movieId);
  Future<MovieImageModel> fetchMovieImages(int movieId) =>moviesApiProvider.fetchMovieImages(movieId);
  Future<ItemModel> fetchMovieList(String type) =>moviesApiProvider.fetchMovieList(type);
}