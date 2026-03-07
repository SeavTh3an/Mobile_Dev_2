import '../../../model/settings/app_settings.dart';
import 'appsetting_repository.dart';

class AppsettingRepositoryMock implements AppsettingRepository {
  AppSettings _appsetting = AppSettings(themeColor: ThemeColor.blue);

  @override
  Future<AppSettings> load() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _appsetting;
  }

  @override
  Future<void> save(AppSettings appsetting) async {
    await Future.delayed(const Duration(milliseconds: 300));
    _appsetting = appsetting;
  }
}
