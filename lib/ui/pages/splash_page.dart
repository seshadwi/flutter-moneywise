import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moneywise_app/shared/theme.dart';

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:moneywise_app/ui/pages/onboarding_page.dart';

import '../../blocs/auth/auth_bloc.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthBloc, AuthState>(
//       listener: (context, state) {
//         if (state is AuthSuccess) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             '/home',
//             (route) => false,
//           );
//         }

//         if (state is AuthFailed) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             '/onboarding',
//             (route) => false,
//           );
//         }
//       },
//       child: Center(
//         child: Stack(
//           children: [
//             SizedBox(
//               width: double.infinity,
//               height: double.infinity,
//               child: FittedBox(
//                 fit: BoxFit.fill,
//                 child: Image.asset('assets/bg_splash.png'),
//               ),
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 24),
//                     child: SizedBox(
//                       width: 80,
//                       height: 91.16,
//                       child: Image.asset('assets/ic_logo_dark.png'),
//                     ),
//                   ),
//                   RichText(
//                     text: TextSpan(
//                       text: 'Money',
//                       style: GoogleFonts.comfortaa().copyWith(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                       children: const <TextSpan>[
//                         TextSpan(
//                           text: 'Wise',
//                           style: TextStyle(
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

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
    // Timer(
    //   const Duration(milliseconds: 2500),
    //   () {
    //     Navigator.pushNamedAndRemoveUntil(
    //         context, '/onboarding', (route) => false);
    //   },
    // );
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
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (route) => false,
          );
        }

        if (state is AuthFailed) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/onboarding',
            (route) => false,
          );
        }
      },
      child: Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset('assets/bg_splash.png'),
              ),
            ),
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
      ),
    );
  }
}
