


class ProductionCountryModel{
  int id;
  String name;
  ProductionCountryModel.fromJson(Map<String , dynamic> parsedJson){
    id = parsedJson['iso_3166_1'];
    name = parsedJson['name'];
  }

  static List<ProductionCountryModel> fromJsonArray(List jsonArray){
    return jsonArray?.map((e) => ProductionCountryModel.fromJson(e))?.toList();
  }
}