import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:im_plugin/im_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('im_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    //expect(await ImPlugin.platformVersion, '42');
  });
}
