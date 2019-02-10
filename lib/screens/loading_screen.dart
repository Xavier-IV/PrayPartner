
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pray_partner/screens/hello/hello_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<LoadingScreen> {
  var animation = 'rotate';

  @override
  void initState() {
    super.initState();
    _setFirstUser();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            FlareActor("assets/images/sebastianczuma-mountain.flr",
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "rotate"),
            Container(
              child: CircularProgressIndicator()
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10.0),
              child: Text('artwork by sebastianczuma',
                  style: TextStyle(color: Colors.white, fontSize: 10.0)),
            )
          ],
        ),
      ),
    );
  }

  void _setTransition() {
    setState(() {
      this.animation = 'Slide';
      Navigator.push(
        context,
        MyCustomRoute(builder: (context) => HelloTwo()),
      );
    });
  }

  _setFirstUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstUser', true);
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }


}
