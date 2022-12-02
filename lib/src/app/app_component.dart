import 'package:firebase_core/firebase_core.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/core/service/Database.dart';
import 'package:travel_nepal/src/routes/application.dart';
import 'package:travel_nepal/src/routes/fluro_router.dart';
import 'package:travel_nepal/src/startup_model.dart';

class AppComponent extends StatefulWidget {
  const AppComponent({Key? key}) : super(key: key);

  @override
  _AppComponentState createState() => _AppComponentState();
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
    final router = FluroRouter();
    Routes.setupRouter(router);
    Application.router = router;
  }

  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return MaterialApp(
        title: "Travel Nepal",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Center(
              child:
                  Text("Major Error found, Please Contact Tech Team for fix")),
        ),
      );
    }

    if (!_initialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Travel Nepal",
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Center(
            child: Text(
              "Loading..",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        StreamProvider<List<DatabaseModel>>.value(
          value: DatabaseService().databaseList,
          initialData: [],
        ),
      ],
      child: StartUpModel(),
    );
  }
}
