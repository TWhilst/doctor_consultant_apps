import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/screens/auth/sign_in_screen.dart';

import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
   final _formKey = GlobalKey<FormState>();

   SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // to put a svg image in a container, you first have to use svg which will require you to use Flutter_Svg_Provider package
    // then the image will be put in a Decorationimage widget
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Svg(
            "assets/icons/Sign_Up_bg.svg",
          ),
        ),
      ),
      child: Scaffold(
        // if you put a container with an image before the scaffold, you have to also
        // change the background color to Colors.transparent
        backgroundColor: Colors.transparent,
        // resizeToAvoidBottomInset: false,
        body: Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create Account",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Text("Already have an account"),
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .push(
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          ),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // The form widget basically acts as one of the containers, which allows us to group and validate the multiple form fields.
                    const SizedBox(height: defaultPadding*2,),
                    SignUpForm(formkey: _formKey,),
                    const SizedBox(height: defaultPadding*2,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


