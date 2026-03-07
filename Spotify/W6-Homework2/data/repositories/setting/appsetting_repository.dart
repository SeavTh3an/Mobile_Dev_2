import '../../../model/settings/app_settings.dart';

abstract class AppsettingRepository {
  Future<AppSettings> load();
  Future<void> save(AppSettings setting);
}
