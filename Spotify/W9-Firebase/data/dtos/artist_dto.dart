import '../../model/artist/artists.dart';

class ArtistDto {
  static const String artistKey = 'name';
  static const String genreKey = 'genre';
  static const String imageKey = 'imageUrl';

  static Artists fromJson(String id, Map<String, dynamic> json) {
    assert(json[artistKey] is String);
    assert(json[genreKey] is String);
    assert(json[imageKey] is String);

    return Artists(
      id: id,
      name: json[artistKey],
      genre: json[genreKey],
      image: Uri.parse(json[imageKey]),
    );
  }

  Map<String, dynamic> toJson(Artists artist) {
    return {
      artistKey: artist.name,
      genreKey: artist.genre,
      imageKey: artist.image.toString(),
    };
  }
}
