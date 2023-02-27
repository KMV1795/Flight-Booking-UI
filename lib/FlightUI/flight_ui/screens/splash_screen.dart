import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5, milliseconds: 500),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInCubic,
  );

  @override
  void initState(){
    super.initState();
    _controller.forward();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/3.jpg"),
                    fit: BoxFit.fill)),
            child: ScaleTransition(
              scale: _animation,
              child: Container(
                  padding: const EdgeInsets.only(right: 35, left: 35),
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset('assets/images/loading_logo.png'),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
