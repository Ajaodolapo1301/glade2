import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:glade_app/screens/home.dart';
import 'package:glade_app/screens/splashPage.dart';

import 'package:glade_app/view_model/AppState.dart';
import 'package:glade_app/view_model/bank.dart';
import 'package:hive/hive.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await  path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_)=>AppState()),
        ChangeNotifierProvider(create: (_)=>BankState()),
      ],
      child: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Glade',
        theme: ThemeData(
          fontFamily: 'BASISGROTESQUEPRO-REGULAR',
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
      ),
    );
  }
}
