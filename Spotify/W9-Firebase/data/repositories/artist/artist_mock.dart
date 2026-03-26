// song_repository_mock.dart

import '../../../model/artist/artists.dart';
import 'artist_repository.dart';

class SongRepositoryMock implements ArtistRepository {
  final List<Artists> _artists = [];

  @override
  Future<List<Artists>> fetchArtist() async {
    return Future.delayed(Duration(seconds: 2), () => _artists);
  }

  @override
  Future<Artists?> fetchArtistById(String id) async {
    return Future.delayed(Duration(seconds: 4), () {
      return _artists.firstWhere(
        (song) => song.id == id,
        orElse: () => throw Exception("No song with id $id in the database"),
      );
    });
  }
}
