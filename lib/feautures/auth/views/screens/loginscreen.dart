import 'package:flutter/material.dart';
import 'package:soko_beauty/feautures/auth/views/widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 250,
            ),
            FormTextInput(
              hintText: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 20,
            ),
            FormTextInput(
              hintText: 'Password',
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Login')),
          ],
        ),
      ),
    ));
  }
}
