import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/animation.dart';

void main() {
  runApp(new MaterialApp(
    home: new Splash(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() =>  _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  Animation animation;
  Animation animationn;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 8), vsync: this);
    animationn = ColorTween(begin: Colors.white, end: Colors.red[900])
        .animate(controller);
    animation = TextStyleTween(begin:TextStyle(
        fontSize: 20.0,
      ),
      end: TextStyle(
        fontSize: 80.0,
      ),).animate(controller)
      ..addListener(() {
        setState(() {
        });
      });
    controller.forward();
    audio();
  }
  

  void audio() {
    AudioCache(fixedPlayer: AudioPlayer()).play('insi.mp3');
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Text('psikopat', style: animation.value,),
         nextScreen: AfterSplash(),
          animationDuration: Duration(seconds: 9),
          backgroundColor: animationn.value,
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'img/e.png',
        ),
        duration: 11,
        nextScreen: MyApp(),
        splashTransition: SplashTransition.decoratedBoxTransition,
      ),
    );
  }
}
class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationn;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 5), vsync: this);
    animationn = TextStyleTween(begin:TextStyle(
        fontSize: 20.0,
      ),
      end: TextStyle(
        fontSize: 80.0,
      ),)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Center(
          child: Column(children: [
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  'play',
                ),
                color: Colors.pink[900],
                textColor: Colors.white,
                onPressed: () =>
                    AudioCache(fixedPlayer: AudioPlayer()).play('insi.mp3')),
            SizedBox(
              width: 300.0,
              child: TextLiquidFill(
                text: 'LIQUIDY',
                waveColor: Colors.blueAccent,
                boxBackgroundColor: Colors.redAccent,
                textStyle: TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
                boxHeight: 300.0,
              ),
            ),
            Text('Psikopat', style: animationn.value,)
          ]),
        ),
      ),
    );
  }
}
