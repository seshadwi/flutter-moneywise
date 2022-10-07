import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

import '../widgets/buttons.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              height: 49,
              width: 191,
              margin: const EdgeInsets.only(
                top: 65,
                bottom: 100,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img_logo_light_mw.png'),
                ),
              ),
            ),
            Text(
              'Join Us to Unlock\nYour Growth',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomFormField(title: 'Full Name'),
                  const SizedBox(height: 16),
                  const CustomFormField(title: 'Email Address'),
                  const SizedBox(height: 16),
                  const CustomFormField(
                    title: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up-set-profile');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            CustomTextButton(
              title: 'Sign In',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-in');
              },
            )
          ],
        ),
      ),
    );
  }
}
