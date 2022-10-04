import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moneywise_app/shared/theme.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];

  List<String> subTitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too',
  ];

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
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
              ),
              carouselController: carouselController,
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
                    titles[currentIndex],
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 26),
                  Text(
                    subTitles[currentIndex],
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
                          color: currentIndex == 0 ? blueColor : lightBgColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: currentIndex == 1 ? blueColor : lightBgColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: currentIndex == 2 ? blueColor : lightBgColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 150,
                        height: 50,
                        child: TextButton(
                          onPressed: () {
                            carouselController.nextPage();
                          },
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
