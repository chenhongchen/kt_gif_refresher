import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_gif_refresher/kt_gif_refresher.dart';

void main() {
  const MethodChannel channel = MethodChannel('kt_gif_refresher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
  });
}
