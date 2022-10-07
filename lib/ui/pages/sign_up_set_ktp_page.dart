import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';
import 'package:moneywise_app/ui/widgets/buttons.dart';
import 'package:moneywise_app/ui/widgets/forms.dart';

class SignUpSetKtpPage extends StatelessWidget {
  const SignUpSetKtpPage({Key? key}) : super(key: key);

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
              'Verify Your\nAccount',
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
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBgColor,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/ic_upload.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: 120,
                  //   height: 120,
                  //   decoration: const BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: AssetImage('assets/img_profile.png'),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 16),
                  Text(
                    'Passport/ID Card',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 30),
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            CustomTextButton(
              title: 'Skip for Now',
              onPressed: () {
                Navigator.pushNamed(context, '/sign-up-success');
              },
            ),
          ],
        ),
      ),
    );
  }
}
