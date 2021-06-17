class ListItem {
  String? imageURL;
  String? title;
  String? subTitle;
  String? ageLimit;
  String? description;
  bool isFavorite;

  ListItem({
    this.imageURL,
    this.title,
    this.subTitle,
    this.ageLimit,
    this.description,
    this.isFavorite = false,
  });
}
