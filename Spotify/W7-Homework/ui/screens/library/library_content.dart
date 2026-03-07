import 'package:flutter/material.dart';
import 'package:my_app/Spotify/W7-Homework/ui/screens/library/library_screen.dart';
import 'package:provider/provider.dart';

import '../../states/settings_state.dart';
import '../../theme/theme.dart';
import 'library_viewmodel_.dart';
import '../../../model/songs/song.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LibraryViewModel>();
    final settings = context.watch<AppSettingsState>();

    return Container(
      color: settings.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.songs.length,
              itemBuilder: (context, index) {
                Song song = viewModel.songs[index];

                return SongTile(
                  song: song,
                  isPlaying: viewModel.currentSong == song,
                  onTap: () {
                    viewModel.play(song);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


