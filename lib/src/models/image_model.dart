
import 'package:flutter/material.dart';

class ImageModel {
  double aspect_ratio;
  String file_path;
  int height;
  String iso_639;
  double vote_average;
  int vote_count;
  int width;

  ImageModel.fromJson(Map<String , dynamic> parsedJson)
  {
    aspect_ratio = parsedJson['aspect_ratio'];
    file_path = parsedJson['file_path'];
    height = parsedJson['height'];
    iso_639 = parsedJson['iso_639_1'];
    vote_average = parsedJson['vote_average'];
    width = parsedJson['width'];
    vote_count = parsedJson['vote_count'];
  }

  static List<ImageModel> fromJsonArray(List jsonArray){
    return jsonArray?.map((e) => ImageModel.fromJson(e))?.toList();
  }
}