class FavouriteModel {
  bool updated;
  bool liked;
  FavouriteModel.formJson(Map<String, dynamic> json) {
    updated = json['updated'];
    liked = json['liked'];
  }
}
