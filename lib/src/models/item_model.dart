import 'base_model.dart';

class ItemModel extends BaseModel {
  int _page;
  int _total_result;
  int _total_pages;
  List<_Result> results = [];

  ItemModel.fromJsom(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_pages = parsedJson['total_pages'];
    _total_result = parsedJson['total_results'];
    List<_Result> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _Result _result = _Result(parsedJson['results'][i]);
      temp.add(_result);
    }
    results = temp;
  }

  // List<_Result> get results => _results;
  // int get total_pages => _total_pages;
  // int get total_result => _total_result;
  // int get pages => _page;
}

class _Result {
  int _vote_count;
  int id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<int> _genre_ids = [];

  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release;
  String _release_date;

  _Result(result) {
    _vote_count = result['vote_count'];
    id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average'];
    _title = result['title'];
    _popularity = result['popularity'];
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];
    for (int i = 0; i < 10; i++) {
      // _genre_ids.add(result['genre_ids'][i]);
    }

    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release = result['release'];
    _release_date = result['release_date'];
  }

  String get release_date => _release_date;
  String get overview => _overview;
  bool get adult => _adult;
  String get backdrop_path => _backdrop_path;
  List<int> get genre_id => _genre_ids;
  String get original_title => _original_title;
  String get original_language => _original_language;
  String get poster_path => _poster_path;
  double get popularity => _popularity;
  String get title => _title;
  String get vote_avergae => _vote_average;
  bool get vedio => _video;

  int get idd => id;
  int get vote_count => _vote_count;
}
