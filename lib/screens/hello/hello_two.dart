import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:pray_partner/screens/prayer_time/prayer_time.dart';

class HelloTwo extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<HelloTwo> implements FlareController{
  var animation = 'Slide';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            FlareActor("assets/images/sebastianczuma-mountain.flr",
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "rotate",
                controller: this),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Your elegant partner",
                    style: TextStyle(
                        color: Theme.of(context).canvasColor, fontSize: 30.0),
                  ),
                ),
                Center(
                    child: Text("ready to assist",
                        style: TextStyle(color: Colors.white))),
                Center(
                  child: Container(
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        child: const Text('Let' 's go!'),
                        color: Theme.of(context).accentColor,
                        elevation: 4.0,
                        splashColor: Theme.of(context).splashColor,
                        onPressed: () {
                          this._setTransition();
                        },
                      )),
                )

              ],
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

  ActorAnimation _slideAnimation;
  ActorAnimation _rotateAnimation;
  double _cometTime = 0.0;
  double _completeTime = 0.0;


  @override
  bool advance(FlutterActorArtboard artboard, double elapsed) {
    if (this.animation == 'Slide' && _cometTime % _slideAnimation.duration <= 0.99) {
      _cometTime += elapsed;
      _completeTime += elapsed;
      _slideAnimation.apply(
          _cometTime % _slideAnimation.duration, artboard, 1.0);
      _rotateAnimation.apply(
          _cometTime % _rotateAnimation.duration, artboard, 1.0);
    }
    return true;
  }

  @override
  void initialize(FlutterActorArtboard actor) {
    _slideAnimation = actor.getAnimation("Slide");
    _rotateAnimation = actor.getAnimation("rotate");
  }

  @override
  void setViewTransform(Mat2D viewTransform) {
    // TODO: implement setViewTransform
  }

  void _setTransition() {
    setState(() {
      this.animation = 'Slide';
      Navigator.push(
        context,
        MyCustomRoute(builder: (context) => PrayerTime()),
      );
    });
  }

}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}