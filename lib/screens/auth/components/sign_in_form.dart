import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled/constants.dart';

import 'sign_up_form.dart';

class SignInForm extends StatelessWidget {
  SignInForm({
    Key? key, required this.formkey,
  }) : super(key: key);

  final GlobalKey formkey;
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Email",),
          // TextFormField widget is used to take input from the user in flutter.
          TextFormField(
            // this is to add an imput of @ at the keyboard
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "test@gmail.com",
            ),
            validator: MultiValidator([
              EmailValidator(errorText: "Use a valid email"),
              RequiredValidator(errorText: "Email is required"),
            ]),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: defaultPadding,),
          const TextFieldName(text: "Password",),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "********",
            ),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: defaultPadding,),
        ],
      ),
    );
  }
}