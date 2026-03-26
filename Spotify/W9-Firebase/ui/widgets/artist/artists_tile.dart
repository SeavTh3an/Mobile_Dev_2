import 'package:flutter/material.dart';
import 'package:my_app/Spotify/W9-Firebase/model/artist/artists.dart';
import '../../../model/artist/artists.dart';

class ArtistTile extends StatelessWidget {
  final Artists artist;

  const ArtistTile({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(artist.image.toString()),
          ),
          title: Text(artist.name),
          subtitle: Text(artist.genre),
        ),
      ),
    );
  }
}
