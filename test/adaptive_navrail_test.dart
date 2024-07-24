import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_navrail/adaptive_navrail.dart';
import 'package:adaptive_navrail/adaptive_navrail_platform_interface.dart';
import 'package:adaptive_navrail/adaptive_navrail_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAdaptiveNavrailPlatform
    with MockPlatformInterfaceMixin
    implements AdaptiveNavrailPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AdaptiveNavrailPlatform initialPlatform = AdaptiveNavrailPlatform.instance;

  test('$MethodChannelAdaptiveNavrail is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAdaptiveNavrail>());
  });

  test('getPlatformVersion', () async {
    AdaptiveNavrail adaptiveNavrailPlugin = AdaptiveNavrail();
    MockAdaptiveNavrailPlatform fakePlatform = MockAdaptiveNavrailPlatform();
    AdaptiveNavrailPlatform.instance = fakePlatform;

    expect(await adaptiveNavrailPlugin.getPlatformVersion(), '42');
  });
}
