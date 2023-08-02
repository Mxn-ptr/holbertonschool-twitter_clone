import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

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
                  child: CustomFlatButton(label: 'Submit', onPressed: () => {}, fontSize: 40, fontWeight: FontWeight.bold),
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
