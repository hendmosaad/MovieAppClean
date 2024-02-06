class Movies {
  final int id;
  final dynamic backdropPath;

  final dynamic title;

  final dynamic overView;

  final dynamic releaseDate;

  final double voteAverage;

  final List<int> genderIds;

  const Movies (
      {
        required this.id,
        required this.overView,
        required  this.genderIds,
        required this.title,
        required  this.backdropPath,
        required  this.releaseDate,
        required  this.voteAverage});



}