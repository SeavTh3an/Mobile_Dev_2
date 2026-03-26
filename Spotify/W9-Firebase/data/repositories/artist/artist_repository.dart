import '../../../model/artist/artists.dart';

abstract class ArtistRepository {
  Future<List<Artists>> fetchArtist();

  Future<Artists?> fetchArtistById(String id);
}
