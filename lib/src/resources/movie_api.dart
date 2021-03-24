import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/src/models/image_model.dart';
import 'package:netflix/src/models/item_model.dart';
import 'package:netflix/src/models/movie_detail_model.dart';
import 'package:netflix/src/models/movie_image_model.dart';



class MovieProvider{


  final _apiKey = "3406d62dd89a4897fdfbe1c59df11b73";


  Future<ItemModel> fetchMovieList(String type)async{
    final path = 'https://api.themoviedb.org/3/movie/upcoming?api_key=3406d62dd89a4897fdfbe1c59df11b73&language=en-US&page=1';
    print("GET REQUEST TO $path");
    var response;

   response = await http.get(path);

    print(response.body.toString());
    if(response.statusCode == 200){
print("HELLO");
      return ItemModel.fromJsom(json.decode(response.body));
    }else
      {

        throw Exception('Failed To Load Data');
      }
  }

  Future<MovieImageModel> fetchMovieImages(int movieId)async{
    final url = 'http://api.themoviedb.org/3/movie/$movieId/images?api_key=$_apiKey&language=en-US';
    print("GET REQUEST TO $url");

    try{
      final response = await http.get(
          url
      );
      print(response.body.toString());
      if(response.statusCode == 200){
        return MovieImageModel.fromJson(json.decode(response.body));
      }else
      {
        throw Exception('Failed To Load Data');
      }
    }catch(Exception){
    }
  }

  Future<MovieDetailModel> fetchMovieDetail(int movieId)async{
    final url = 'http://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey';
    print("GET REQUEST TO $url");

    try{
      final response = await http.get(
          url
      );
      print(response.body.toString());
      if(response.statusCode == 200){
        return MovieDetailModel.fromJson(json.decode(response.body));
      }else
      {
        throw Exception('Failed To Load Data');
      }
    }catch(Exception){
    }
  }

}