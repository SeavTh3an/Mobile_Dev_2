import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';
import '../../../widgets/song/song_tile.dart';
import '../view_model/library_view_model.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // 1- Read the globbal song repository
    LibraryViewModel mv = context.watch<LibraryViewModel>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
          SizedBox(height: 50),

          Expanded(
            child: Builder(
              builder: (context) {
                //Loading
                if (mv.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                //Error
                if (mv.error != null) {
                  return Center(
                    child: Text(
                      "ERROR: ${mv.error}",
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                //Success
                return ListView.builder(
                  itemCount: mv.songs.length,
                  itemBuilder: (context, index) {
                    return SongTile(
                      song: mv.songs[index],
                      isPlaying: mv.isSongPlaying(mv.songs[index]),
                      onTap: () {
                        mv.start(mv.songs[index]);
                      },
                    );
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
