import 'package:flutter_test/flutter_test.dart';
import 'package:my_system_platform_interface/my_system_platform_interface.dart';
import 'package:my_system_web/my_system_web.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MySystemWeb', () {
    const kPlatformName = 'Web';
    late MySystemWeb mySystem;

    setUp(() async {
      mySystem = MySystemWeb();
    });

    test('can be registered', () {
      MySystemWeb.registerWith();
      expect(MySystemPlatform.instance, isA<MySystemWeb>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await mySystem.getPlatformName();
      expect(name, equals(kPlatformName));
    });
  });
}
