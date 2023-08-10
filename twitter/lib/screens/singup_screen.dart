import 'package:flutter/material.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';
import 'package:twitter/providers/auth_state.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _emailController = _emailController;
    _passwordController = _passwordController;
    _nameController = _nameController;
    _confirmController = _confirmController;
    _formKey = _formKey;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmController.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Auth();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Sign Up', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold))),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                Image.asset(
                  'images/twitter.png',
                  height: 100,
                  width: 100,
                ),
                CustomEntryField(hint: 'Enter name', controller: _nameController),
                CustomEntryField(hint: 'Enter email', controller: _emailController),
                CustomEntryField(hint: 'Enter password', controller: _passwordController, isPassword: true),
                CustomEntryField(hint: 'Confirm password', controller: _confirmController, isPassword: true),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomFlatButton(
                    label: 'Submit',
                    onPressed: () async {
                      final res = await auth.attemptSignUp(
                        _emailController.text,
                        _nameController.text,
                        _passwordController.text,
                        _confirmController.text
                      );
                      if (res == Errors.none) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignIn())
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account Created!"))
                        );
                      } else {
                        String errorMessage = "";
                        if (res == Errors.weakError) {
                          errorMessage = "The password provided is too weak.";
                        } else if (res == Errors.matchError) {
                          errorMessage = "Passwords doesn't match";
                        } else if (res == Errors.existsError) {
                          errorMessage = "An account already exists with that email.";
                        } else if (res == Errors.error) {
                          errorMessage = "Failed to create account! Please try later";
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
              ],
            ),
          )
        ),
      )
      )
    );
  }
}
