import 'package:flutter/material.dart';
import 'package:gpa_calculator/screens/login_page.dart';
import 'package:gpa_calculator/utils/custom_navigations.dart';
// import 'package:green_ghana_scanner/main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<PageViewModel> listPagesViewModel = [
    PageViewModel(
      title: "Welcome to GPA Calculator",
      bodyWidget: const Text(
        'Track your academic journey effortlessly. \n\nCalculate your GPA and cgpa accurately, and see where you stand in your academic performance.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      image: Center(child: Image.asset('assets/images/on1.png')),
    ),
    PageViewModel(
      title: "Add your Courses",
      bodyWidget: const Text(
        'Easily add your course details, including credit hours and grades. \n\nWe handle the calculations for you.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      image: Center(child: Image.asset('assets/images/on2.png')),
    ),
    PageViewModel(
      title: "Calculate and Analyze",
      bodyWidget: const Text(
        'Get instant results and insights. \n\nKnow your GPA, cgpa, and your degree classification based on the latest data.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      image: Center(child: Image.asset('assets/images/on3.png')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 10,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: IntroductionScreen(
        pages: listPagesViewModel,
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        skip: const Text("Skip"),
        done: const Text("Done"),
        next: const Icon(Icons.arrow_forward_ios_rounded),
        onDone: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('intro', false);
          nextNavRemoveHistory(context, LoginPage());
        },
      ),
    );
  }
}
