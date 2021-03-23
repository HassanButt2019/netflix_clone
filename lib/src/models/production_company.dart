



class ProductionCompanyModel{
  int id;
  String logo_path;
  String name;
  String origin_country;


  ProductionCompanyModel.fromJson(Map<String , dynamic> parsedJson){
    id = parsedJson['id'];
    logo_path = parsedJson['logo_path'];
    name = parsedJson['name'];
    origin_country = parsedJson['origin_country'];
  }

  static List<ProductionCompanyModel> fromJsonArray(List jsonArray){
    return jsonArray?.map((e) => ProductionCompanyModel.fromJson(e))?.toList();
  }
}