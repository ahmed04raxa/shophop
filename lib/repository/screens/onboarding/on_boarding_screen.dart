import 'package:flutter/material.dart';
import 'package:shophop/domain/constants/app_colors.dart';
import 'package:shophop/domain/constants/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                OnBoardingContent(
                  img: "assets/images/onboarding1.png",
                  title: "Choose Products",
                  description:
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
                ),
                OnBoardingContent(
                  img: "assets/images/onboarding2.png",
                  title: "Make Payment",
                  description:
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
                ),
                OnBoardingContent(
                  img: "assets/images/onboarding2.png",
                  title: "Get Your Order",
                  description:
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint.",
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: Color(0XFF17223B),
                dotColor: Color(0XFFC4C4C4),
              ),
            ),
            TextButton(
              onPressed: () {
                if (currentIndex == 2) {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.loginScreen,
                  );
                } else {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "bold",
                  color: AppColors.textColorRed,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class OnBoardingContent extends StatelessWidget {
  final String img, title, description;

  const OnBoardingContent({
    super.key,
    required this.img,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img),
        SizedBox(height: 20),
        Text(title, style: TextStyle(fontSize: 24, fontFamily: "bold")),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "bold",
              color: Color(0XFFA8A8A9),
            ),
          ),
        ),
      ],
    );
  }
}
