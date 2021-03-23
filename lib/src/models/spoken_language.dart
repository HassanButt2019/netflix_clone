


class SpokenLanguageModel{
  String iso_639;
  String name;


  SpokenLanguageModel.fromJson(Map<String , dynamic> parsedJson){
    iso_639 = parsedJson['iso_639_1'];
    name = parsedJson['name'];
  }

  static List<SpokenLanguageModel> fromJsonArray(List jsonArray){
    return jsonArray?.map((e) => SpokenLanguageModel.fromJson(e))?.toList();
  }
}