import 'package:my_system_platform_interface/src/method_channel_my_system.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of my_system must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `MySystem`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [MySystemPlatform] methods.
abstract class MySystemPlatform extends PlatformInterface {
  /// Constructs a MySystemPlatform.
  MySystemPlatform() : super(token: _token);

  static final Object _token = Object();

  static MySystemPlatform _instance = MethodChannelMySystem();

  /// The default instance of [MySystemPlatform] to use.
  ///
  /// Defaults to [MethodChannelMySystem].
  static MySystemPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [MySystemPlatform] when they register themselves.
  static set instance(MySystemPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
