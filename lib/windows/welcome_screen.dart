import 'package:flutter/material.dart';
import 'package:login_register_ui_design/components/shared/background.dart';

import '../components/item/onboardingItem.dart';
import '../components/shared/app_button.dart';
import '../core/router_generator.dart';
import '../core/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "title": "Explore the world easily",
      "text": "To your desire.",
      "image": "res/images/onboardingImage_1.svg"
    },
    {
      "title": "Reach the unknown spot",
      "text": "To your destination.",
      "image": "res/images/onboardingImage_2.svg"
    },
    {
      "title": "Make connects with explora",
      "text": "To your dream trip.",
      "image": "res/images/onboardingImage_2.svg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingItem(
                title: onboardingData[index]["title"],
                image: onboardingData[index]["image"],
                text: onboardingData[index]['text'],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: defaultPadding * 4.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                          (index) => buildDot(index: index),
                    ),
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: AppButton(
                            callback: () => Navigator.pushNamed(
                                context, RouterGenerator.loginRoute),
                            label: "Login",
                            buttonType: ButtonType.PRIMARY,
                            horizontalPadding: 12.0),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RouterGenerator.registerRoute);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Text(
                              "Register",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFF6C63FF) : const Color(0xFF2F2E41),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
