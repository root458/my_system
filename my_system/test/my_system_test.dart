import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_system/my_system.dart';
import 'package:my_system_platform_interface/my_system_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMySystemPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements MySystemPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MySystem', () {
    late MySystemPlatform mySystemPlatform;

    setUp(() {
      mySystemPlatform = MockMySystemPlatform();
      MySystemPlatform.instance = mySystemPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => mySystemPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => mySystemPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
