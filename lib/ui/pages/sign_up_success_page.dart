import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Akun Berhasil\nTerdaftar',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              Text(
                'Grow your finance start\ntogether with us',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              CustomFilledButton(
                title: 'Get Started',
                width: 183,
                height: 50,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
