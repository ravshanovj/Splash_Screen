import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splash_screen/view/home_page.dart';
import 'package:splash_screen/view/info_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/second':
            return PageTransition(
              child: const InfoPage(),
              type: PageTransitionType.fade,
              settings: settings,
              reverseDuration: const Duration(seconds: 3),
            );
          default:
            return null;
        }
      },
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: /* Icons.home */ _centerSplashScreen(),
        nextScreen: const MyHomePage(title: 'YouTube'),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.rotate,
        backgroundColor: Colors.blue,
      ),
    );
  }

  Center _centerSplashScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.amber,
          ),
          const SizedBox(
            child: Text(
              'Splash Screen',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
