import 'package:my_system_platform_interface/my_system_platform_interface.dart';

/// The Web implementation of [MySystemPlatform].
class MySystemWeb extends MySystemPlatform {
  /// Registers this class as the default instance of [MySystemPlatform]
  static void registerWith([Object? registrar]) {
    MySystemPlatform.instance = MySystemWeb();
  }

  @override
  Future<String?> getPlatformName() async => 'Web';
}
