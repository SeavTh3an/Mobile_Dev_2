import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/artist/artists.dart';
import '../../../theme/theme.dart';
import '../../../utils/async_value.dart';
import '../../../widgets/artist/artists_tile.dart';
import '../view_model/artist_vm.dart';


class ArtistsContent extends StatelessWidget {
  const ArtistsContent({super.key});

  @override
  Widget build(BuildContext context) {
    ArtistViewModel mv = context.watch<ArtistViewModel>();

    AsyncValue<List<Artists>> asyncValue = mv.artistsValue;

    Widget content;
    switch (asyncValue.state) {
      case AsyncValueState.loading:
        content = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        content = Center(
          child: Text(
            'error = ${asyncValue.error!}',
            style: TextStyle(color: Colors.red),
          ),
        );
        break;
      case AsyncValueState.success:
        List<Artists> artists = asyncValue.data!;
        content = ListView.builder(
          itemCount: artists.length,
          itemBuilder: (context, index) => ArtistTile(artist: artists[index]),
        );
    }

        return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Artists", style: AppTextStyles.heading),
          SizedBox(height: 50),
          Expanded(child: content),
        ],
      ),
    );
  }
}
