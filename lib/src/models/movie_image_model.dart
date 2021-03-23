


import 'package:netflix/src/models/base_model.dart';
import 'package:netflix/src/models/image_model.dart';

class MovieImageModel extends BaseModel{
  int id;
  List<ImageModel> posters = [];
  List<ImageModel> backdrops = [];
  MovieImageModel.fromJson(Map<String , dynamic> parsedJson){
    id = parsedJson['id'];
    posters = ImageModel.fromJsonArray(parsedJson['posters']);
    backdrops =  ImageModel.fromJsonArray(parsedJson['backdrops']);
  }
}