import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/artist_vm.dart';
import '../../../data/repositories/artist/artist_repository.dart';
import 'widget/artist_content.dart';

class ArtistsScreen extends StatelessWidget {
  const ArtistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ArtistViewModel(artistRepository: context.read<ArtistRepository>()),
      child: ArtistsContent(),
    );
  }
}
