import 'package:flutter_test/flutter_test.dart';
import 'package:my_system_platform_interface/my_system_platform_interface.dart';

class MySystemMock extends MySystemPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('MySystemPlatformInterface', () {
    late MySystemPlatform mySystemPlatform;

    setUp(() {
      mySystemPlatform = MySystemMock();
      MySystemPlatform.instance = mySystemPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await MySystemPlatform.instance.getPlatformName(),
          equals(MySystemMock.mockPlatformName),
        );
      });
    });
  });
}
