import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  static final Uri uri = Uri.https(
    'https://week9-project-b7996-default-rtdb.asia-southeast1.firebasedatabase.app/',
  );
  static final Uri songUri = uri.replace(path: '/songs.json');
  static final Uri artistUri = uri.replace(path: '/artists.json');

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      //Decode json
      Map<String, dynamic> data = json.decode(response.body);
      final List<Song> songs = [];

      for (var i in data.entries) {
        String id = i.key;
        Map<String, dynamic> data = i.value;
        songs.add(SongDto.fromJson(id, data));
      }
      return songs;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}
}
