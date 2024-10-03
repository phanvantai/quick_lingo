import 'package:quick_lingo/core/common/app_info.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Get the app information
Future<AppInfo> appInfo() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return AppInfo(
    appName: packageInfo.appName,
    packageName: packageInfo.packageName,
    version: packageInfo.version,
    buildNumber: packageInfo.buildNumber,
  );
}
