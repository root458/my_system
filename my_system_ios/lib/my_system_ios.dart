import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:my_system_platform_interface/my_system_platform_interface.dart';

/// The iOS implementation of [MySystemPlatform].
class MySystemIOS extends MySystemPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_system_ios');

  /// Registers this class as the default instance of [MySystemPlatform]
  static void registerWith() {
    MySystemPlatform.instance = MySystemIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
