import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/artist/artists.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistFirebase extends ArtistRepository {
  static final Uri uri = Uri.https(
    'week9-project-b7996-default-rtdb.asia-southeast1.firebasedatabase.app',
  );

  static final Uri artistUri = uri.replace(path: '/artists.json');

  @override
  Future<List<Artists>> fetchArtist() async {
    final http.Response response = await http.get(artistUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      //Decode json
      Map<String, dynamic> data = json.decode(response.body);
      final List<Artists> artists = [];

      for (var i in data.entries) {
        String id = i.key;
        Map<String, dynamic> data = i.value;
        artists.add(ArtistDto.fromJson(id, data));
      }
      return artists;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Artists?> fetchArtistById(String id) async {}
}
