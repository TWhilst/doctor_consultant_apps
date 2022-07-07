import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/auth/sign_in_screen.dart';
import 'package:untitled/screens/auth/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //The constraints passed into the Stack from its parent is tightened to their biggest size
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/splash_bg.svg",fit: BoxFit.cover,),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/gerda_logo.svg",),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context)
                          .push(
                        MaterialPageRoute(builder: (context) => SignUpScreen(),),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xFF6CD8D1),
                        padding: const EdgeInsets.all(defaultPadding),
                      ),
                      child: const Text("Sign Up"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context)
                        .push(
                          MaterialPageRoute(builder: (context) => SignInScreen(),),
                        ),
                        style: TextButton.styleFrom(
                          // the transparent is to see through the button
                          backgroundColor: Colors.transparent,
                          // this is an elevated button so this is to reduce the elevation
                          elevation: 0,
                          // this is to give the border a shape
                          shape: const RoundedRectangleBorder(
                            // this is to give the border a color
                            side: BorderSide(color: Color(0xFF6CD8D1),),
                          ),
                        ),
                        child: const Text("Sign In"),
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultPadding,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
