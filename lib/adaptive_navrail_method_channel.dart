import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'adaptive_navrail_platform_interface.dart';

/// An implementation of [AdaptiveNavrailPlatform] that uses method channels.
class MethodChannelAdaptiveNavrail extends AdaptiveNavrailPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('adaptive_navrail');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
