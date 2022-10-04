import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneywise_app/shared/theme.dart';

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    repeatOnce();
    Timer(Duration(milliseconds: 3500), () {
      Navigator.pushNamed(context, '/sign-up');
    });
  }

  void repeatOnce() async {
    await _controller.forward();
    // await _controller.reverse();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Image.asset('assets/bg_splash.png'),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SizedBox(
                    width: 80,
                    height: 91.16,
                    child: FadeTransition(
                      opacity: _animation,
                      child: Image.asset('assets/ic_logo_dark.png'),
                    ),
                  ),
                ),
                // AnimatedTextKit(
                //   animatedTexts: [
                //     TypewriterAnimatedText(

                //       'MoneyWise',
                //       textStyle: GoogleFonts.comfortaa().copyWith(
                //         fontSize: 32,
                //         fontWeight: FontWeight.bold,
                //         color: const Color(0xffFFFFFF),
                //       ),
                //       speed: const Duration(milliseconds: 100),
                //     ),
                //   ],
                // ),
                FadeTransition(
                  opacity: _animation,
                  child: RichText(
                    text: TextSpan(
                      text: 'Money',
                      style: GoogleFonts.comfortaa().copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Wise',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}