import 'package:co_work_connect/core/widgets/custom_general_button.dart';
import 'package:co_work_connect/features/screens/home.dart';
import 'package:flutter/material.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox.expand(
            child: Image.asset('assets/strt.png',fit: BoxFit.cover),
          ),

          // Bottom Container
          Align(
  alignment: Alignment.bottomCenter,
  child: Container(
    width: double.infinity,
    // بدل ما نثبت height، نخليها minHeight
    constraints: BoxConstraints(
      minHeight: height * 0.40,
      maxHeight: height * 0.55,
    ),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 98, 98, 98).withValues(alpha: 0.01),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(90),
        topRight: Radius.circular(90),
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 15,
          offset: Offset(0, -6),
        ),
      ],
    ),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // يوزع العناصر
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            'Find your\nfavourite\nCo-working\nspace',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: height * 0.05, // الخط يتغير حسب حجم الشاشة
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomGeneralButton(
            text: "Get Started",
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 800),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Home(),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
