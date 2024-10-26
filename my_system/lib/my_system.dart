import 'package:my_system_platform_interface/my_system_platform_interface.dart';

MySystemPlatform get _platform => MySystemPlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
