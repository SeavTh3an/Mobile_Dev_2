import 'package:flutter/widgets.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../../model/songs/song.dart';
import '../../states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository _songrepository;
  final PlayerState _playerState;

  List<Song> _songs = [];

  LibraryViewModel(this._playerState, this._songrepository);

  void init() {
    _songs = _songrepository.fetchSongs();

    //listen to player changes
    _playerState.addListener(_onplayerChanged);
  }

  void _onplayerChanged() {
    notifyListeners();
  }

  List<Song> get songs => _songs;
  Song? get currentSong => _playerState.currentSong;

  void play(Song song) {
    _playerState.start(song);
  }

  void stop() {
    _playerState.stop();
  }

  @override
  void disposed() {
    _playerState.removeListener(_onplayerChanged);
    super.dispose();
  }
}
