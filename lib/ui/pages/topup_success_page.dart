import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import '../widgets/buttons.dart';

class TopUpSuccessPage extends StatelessWidget {
  const TopUpSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Top Up\nWallet Berhasil',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 26),
              Text(
                'Use the money wisely and\ngrow your finance',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              CustomFilledButton(
                title: 'Back to Home',
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
