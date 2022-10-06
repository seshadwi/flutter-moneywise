import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    Key? key,
    required this.title,
    required this.width,
    required this.height,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SignInPage(),
          //   ),
          // );
        },
        style: TextButton.styleFrom(
          backgroundColor: purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
        ),
        child: Text(
          'Get Started',
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
