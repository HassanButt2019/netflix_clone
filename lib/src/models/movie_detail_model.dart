import 'package:netflix/src/models/base_model.dart';
import 'package:netflix/src/models/belong_to_collection_model.dart';
import 'package:netflix/src/models/genre_model.dart';
import 'package:netflix/src/models/production_company.dart';
import 'package:netflix/src/models/production_country.dart';
import 'package:netflix/src/models/spoken_language.dart';

class MovieDetailModel extends BaseModel {
  bool adult;
  String backdrop_path;
  BelongToCollectionModel belongToCollectionModel;
  int budget;
  List<GenreModel> genres = [];
  String homePage;
  int id;
  String imdb_id;
  String original_langiage;
  String original_title;
  String overview;
  String popularity;
  String poster_path;
  String release_date;
  int revenue;
  int runtime;
  List<ProductionCountryModel> productionCountryModel = [];
  List<ProductionCompanyModel> productionCompanyModel = [];
  List<SpokenLanguageModel> spokenLanguageModel = [];
  String status;
  String tagline;
  bool video;
  double vote_average;
  int vote_count;

  MovieDetailModel.fromJson(Map<String, dynamic> parsedJson) {
    adult = parsedJson['adult'];
    backdrop_path = parsedJson['backdrop_path'];
    belongToCollectionModel =
        BelongToCollectionModel.fromJson(parsedJson['belongs_to_collection']);
    budget = parsedJson['budget'];
    genres = GenreModel.fromJsonArray(parsedJson['genres']);
    homePage = parsedJson['homepage'];
    id = parsedJson['id'];
    imdb_id = parsedJson['imdb_id'];
    original_langiage = parsedJson['original_language'];
    original_title = parsedJson['original_title'];
    overview = parsedJson['overview'];
    popularity = parsedJson['popularity'];
    poster_path = parsedJson['poster_path'];
    productionCompanyModel = ProductionCompanyModel.fromJsonArray(
        parsedJson['production_companies']);
    productionCountryModel = ProductionCountryModel.fromJsonArray(
        parsedJson['production_countries']);
    release_date = parsedJson['release_date'];
    revenue = parsedJson['revenue'];
    runtime = parsedJson['runtime'];
    spokenLanguageModel =
        SpokenLanguageModel.fromJsonArray(parsedJson['spoken_languages']);

    status = parsedJson['status'];
    tagline = parsedJson['tagline'];
    video = parsedJson['video'];
    vote_average = parsedJson['vote_average'];
    vote_count = parsedJson['vote_count'];

    poster_path = parsedJson['poster_path'];
  }
}
