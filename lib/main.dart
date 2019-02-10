
import 'package:flutter/material.dart';
import 'package:pray_partner/screens/hello/hello.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prayer Partner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Hello();
//    return new Container(
//        child: FutureBuilder<SharedPreferences>(
//      future: SharedPreferences.getInstance(),
//      builder:
//          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
//        switch (snapshot.connectionState) {
//          case ConnectionState.none:
//          case ConnectionState.waiting:
//            return new LoadingScreen();
//          default:
//            if (!snapshot.hasError) {
//              if (snapshot.data.getBool("firstUser") != null) {
//                return new ScreenThird();
//              } else {
//                return new Screen();
//              }
//
//            } else {
//              return LoadingScreen();
//            }
//        }
//      },
//    ));
  }
}
