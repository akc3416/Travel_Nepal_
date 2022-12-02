import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

const String _TOURANDTRAVEL = "tourandtravel";
const String _TRANSPORT = "transport";

class RemoteConfigService {
  late final RemoteConfig _remoteConfig;
  RemoteConfigService({required RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  final defaults = <String, dynamic>{_TOURANDTRAVEL: "[]", _TRANSPORT: "[]"};

  static late RemoteConfigService _instance;
  static Future<RemoteConfigService> getInstance() async {
    // ignore: unnecessary_null_comparison
    if (_instance == null) {
      _instance = RemoteConfigService(
        remoteConfig: RemoteConfig.instance,
      );
    }
    return _instance;
  }

  String get getTourAndTravel => _remoteConfig.getString(_TOURANDTRAVEL);
  String get getTransport => _remoteConfig.getString(_TRANSPORT);

  Future initialize() async {
    try {
      await _remoteConfig.setDefaults(defaults);
      await _fetchAndActivate();
    } on PlatformException catch (e) {
      print("Remote Config fetch throttled: $e");
    } catch (e) {
      print("Unable to fetch remote config. Default value will be used");
    }
  }

  Future _fetchAndActivate() async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: Duration(seconds: 10),
      minimumFetchInterval: Duration.zero,
    ));
    await _remoteConfig.fetchAndActivate();
    // print("Version::: $getVersion");
    // print("Update Link::: $getUpdateLinkValue");
  }
}
