import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/img_onboarding1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/img_onboarding3.png',
                  height: 331,
                ),
              ],
              options: CarouselOptions(
                height: 331,
                viewportFraction: 1,
                enableInfiniteScroll: false,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'Grow Your\nFinancial Today',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 26),
                  Text(
                    'Our system is helping you to achieve a better  goal',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: blueColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: lightBgColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: lightBgColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 150,
                        height: 50,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(56),
                            ),
                          ),
                          child: Text(
                            'Continue',
                            style: whiteTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ),
                      ),
                    ],
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
