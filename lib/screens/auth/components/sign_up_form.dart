import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:untitled/constants.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({
    Key? key, required this.formkey,
  }) : super(key: key);

  final GlobalKey formkey;
  late String _username, _email, _password, _phoneNo;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: "Username",),
          // TextFormField widget is used to take input from the user in flutter.
          TextFormField(
            decoration: const InputDecoration(
              hintText: "theflutterway",
            ),
            validator: RequiredValidator(errorText: "Username is required"),
            onSaved: (username) => _username = username!,
          ),
          const SizedBox(height: defaultPadding,),
          const TextFieldName(text: "Email",),
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
          const TextFieldName(text: "Phone",),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: "+234 8011111111",
            ),
            validator: RequiredValidator(errorText: "Phone number is required"),
            onSaved: (phoneNo) => _phoneNo = phoneNo!,
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
            //this allows you to save your current password to validate if it's the same
            // to validate, we use match validator
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: defaultPadding,),
          const TextFieldName(text: "Confirm password",),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "********",
            ),
            validator: (pass) => MatchValidator(errorText: "Password do not match").validateMatch(pass!, _password),
          ),
        ],
      ),
    );
  }
}

class TextFieldName extends StatelessWidget {
  const TextFieldName({
    Key? key, required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding/3),
      child: Text(
        text,
        style: const TextStyle(
            fontWeight: FontWeight.w600, color: Colors.black54
        ),
      ),
    );
  }
}