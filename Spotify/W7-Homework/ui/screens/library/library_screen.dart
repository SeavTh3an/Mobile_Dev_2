import 'package:flutter/material.dart';
import 'package:my_app/Spotify/W7-Homework/ui/screens/library/library_content.dart';
import 'package:my_app/Spotify/W7-Homework/ui/screens/library/library_viewmodel_.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../../model/songs/song.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';
import '../../theme/theme.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    final songRepository = context.read<SongRepository>();
    List<Song> songs = songRepository.fetchSongs();

    // 2- Read the globbal settings state
    AppSettingsState settingsState = context.read<AppSettingsState>();

    // 3 - Watch the globbal player state
    final playerState = context.read<PlayerState>();

    return ChangeNotifierProvider(
      create: (_) {
        final vm = LibraryViewModel(playerState, songRepository);
        vm.init();
        return vm;
      },
      child: LibraryContent(),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
