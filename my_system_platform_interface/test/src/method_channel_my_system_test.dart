import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_system_platform_interface/src/method_channel_my_system.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelMySystem', () {
    late MethodChannelMySystem methodChannelMySystem;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelMySystem = MethodChannelMySystem();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelMySystem.methodChannel,
        (methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        },
      );
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName = await methodChannelMySystem.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
