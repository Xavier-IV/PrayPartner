import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:pray_partner/screens/screen_second.dart';

class ScreenThird extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<ScreenThird> implements FlareController {
  var animation = 'second_page';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Stack(
          children: <Widget>[
            FlareActor("assets/images/sebastianczuma-mountain.flr",
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: "second_page",
                controller: this),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Let's start by",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 40.0),
                    )),
                Container(
                    child: Text(
                  "configuring your timezone prayer",
                  style: TextStyle(
                      color: Theme.of(context).canvasColor, fontSize: 10.0),
                )),
                Container(
                  padding: EdgeInsets.all(20)
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Subuh - 6.00",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 20.0),
                    )),
                Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Zuhr - 1.30",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 20.0),
                    )),
                Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Asar - 4.30",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 20.0),
                    )),
                Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Maghrib - 7.30",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 20.0),
                    )),
                Container(
                    padding: EdgeInsets.all(20.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Isyak - 8.30",
                      style: TextStyle(
                          color: Theme.of(context).canvasColor, fontSize: 20.0),
                    )),
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
    if (this.animation == 'Slide' &&
        _cometTime % _slideAnimation.duration <= 0.99) {
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
