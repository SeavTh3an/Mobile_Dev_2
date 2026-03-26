import 'package:flutter/material.dart';
import '../../../../data/repositories/artist/artist_repository.dart';
import '../../../../model/artist/artists.dart';
import '../../../utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;

  AsyncValue<List<Artists>> artistsValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository}) {
    _init();
  }

  void _init() async {
    fetchArtists();
  }
    void fetchArtists() async {
    // 1- Loading state
    artistsValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2- Fetch is successful
      List<Artists> artists = await artistRepository.fetchArtist();
      artistsValue = AsyncValue.success(artists);
    } catch (e) {
      // 3- Fetch is unsuccessful
      artistsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
