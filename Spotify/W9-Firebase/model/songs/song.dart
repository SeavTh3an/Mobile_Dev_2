import '../artist/artists.dart';

class Song {
  final String id;
  final String title;
  final Artists artistsid;
  final Duration duration;
  final Uri imageUrl;

  Song({
    required this.id,
    required this.title,
    required this.artistsid,
    required this.duration,
    required this.imageUrl
  });

  @override
  String toString() {
    return 'Song(title: $title, artistId: $artistsid, duration: $duration)';
  }
}
