import 'package:flutter/material.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/forgot_password_screen.dart';
import 'package:twitter/screens/singup_screen.dart';
import 'package:twitter/widgets/bar_menu.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = _emailController;
    _passwordController = _passwordController;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUp())  
    );
  }

  void _navigateToForgetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ForgetPassword())  
    );
  }

  void _navigateToBarMenu() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BarMenu())
    );
  }

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ),
                Image.asset(
                  'images/twitter.png',
                  height: 100,
                  width: 100,
                ),
                CustomEntryField(hint: 'Enter email', controller: _emailController),
                CustomEntryField(hint: 'Enter password', controller: _passwordController, isPassword: true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomFlatButton(
                    label: 'Submit',
                    onPressed: () async {
                      final res = await auth.attemptLogin(_emailController.text, _passwordController.text);
                      if (res == Errors.none) {
                        _navigateToBarMenu();
                      } else {
                        String errorMessage = "";
                        if (res == Errors.noUserError) {
                          errorMessage = "No user found for that email!";
                        } else if (res == Errors.wrongError) {
                          errorMessage = "Wrong password!";
                        } else if (res == Errors.error) {
                          errorMessage = "Failed to Login! Please try later";
                        } else {
                          errorMessage = "You need to fill each field to submit";
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage), backgroundColor: Colors.red,)
                        );
                      }
                    },
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomFlatButton(label: 'Sign Up', onPressed: _navigateToSignUp, fontSize: 20),
                ),
                CustomFlatButton(label: 'Forget password?', onPressed: _navigateToForgetPassword, fontSize: 20),
              ],
            ),
          )
        ),
      )
    );
  }
}
