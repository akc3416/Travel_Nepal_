import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_nepal/src/core/service/remote_config_service.dart';
import 'package:travel_nepal/src/routes/application.dart';
import 'package:travel_nepal/src/shared/preferences.dart';

class StartUpModel extends StatefulWidget {
  const StartUpModel({Key? key}) : super(key: key);

  @override
  _StartUpModelState createState() => _StartUpModelState();
}

class _StartUpModelState extends State<StartUpModel> {
  late RemoteConfigService _remoteConfigService;

  initializeRemoteConfig() async {
    _remoteConfigService = await RemoteConfigService.getInstance();
    await _remoteConfigService.initialize();

    setState(() {
      DataHandler.tourandtravel = _remoteConfigService.getTourAndTravel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Travel Nepal',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
