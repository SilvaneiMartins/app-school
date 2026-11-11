import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import "package:school/home/home_screen.dart";
import "package:school/utils/route_utils.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigateToHomeScreen() async {
    await Future.delayed(Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        RouteUtils.animateToRoute(
          destination: HomeScreen(),
          offset: Offset(0, -1),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateToHomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Ola Pessoal!")));
  }
}
