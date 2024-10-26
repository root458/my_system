import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_system_ios/my_system_ios.dart';
import 'package:my_system_platform_interface/my_system_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MySystemIOS', () {
    const kPlatformName = 'iOS';
    late MySystemIOS mySystem;
    late List<MethodCall> log;

    setUp(() async {
      mySystem = MySystemIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(mySystem.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      MySystemIOS.registerWith();
      expect(MySystemPlatform.instance, isA<MySystemIOS>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await mySystem.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
