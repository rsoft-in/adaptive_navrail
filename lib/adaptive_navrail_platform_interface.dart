import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'adaptive_navrail_method_channel.dart';

abstract class AdaptiveNavrailPlatform extends PlatformInterface {
  /// Constructs a AdaptiveNavrailPlatform.
  AdaptiveNavrailPlatform() : super(token: _token);

  static final Object _token = Object();

  static AdaptiveNavrailPlatform _instance = MethodChannelAdaptiveNavrail();

  /// The default instance of [AdaptiveNavrailPlatform] to use.
  ///
  /// Defaults to [MethodChannelAdaptiveNavrail].
  static AdaptiveNavrailPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AdaptiveNavrailPlatform] when
  /// they register themselves.
  static set instance(AdaptiveNavrailPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
