import 'package:provider/provider.dart';
import 'package:nested/nested.dart';

import 'main_common.dart';
import 'data/repositories/songs/song_repository.dart';
import 'data/repositories/songs/song_repository_mock.dart';
import 'ui/states/settings_state.dart';
import 'data/repositories/setting/appsetting_repository.dart';
import 'data/repositories/setting/appsetting_repository_mock.dart';

/// Configure provider dependencies for dev environment
List<SingleChildWidget> get devProviders {
  return [
    // 1 - Inject the song repository
    Provider<SongRepository>(create: (_) => SongRepositoryMock()),

    Provider<AppsettingRepositoryMock>(create: (_) => AppsettingRepositoryMock()),

    // 3 - Inject the  app setting state
    ChangeNotifierProvider<AppSettingsState>(
      create: (Context) {
        final repo = Context.read<AppsettingRepositoryMock>();
        final state = AppSettingsState(repo);
        state.init();
        return state;
      },
    ),
  ];
}

void main() {
  mainCommon(devProviders);
}
