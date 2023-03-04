
class FavoritesModel {
  FavoritesModel({required this.favorites});

  final Map<String, bool> favorites;

  factory FavoritesModel.fromJson(List<dynamic> json){
    Map<String, bool> favs = {};
    for (var element in json) {
      favs[element['id_product']] = true;
    }
    print(favs.toString());
    return FavoritesModel(favorites: favs);
  }
}
