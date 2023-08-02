import 'package:flutter/material.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/flat_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = _emailController;
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.blue),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Forget Password', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold))
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                  'Forget Password',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  )
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Enter your email address below to receive password reset instructions',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Color.fromRGBO(0, 0, 0, 0.5)),
                  )
                ),
                CustomEntryField(hint: 'Enter email', controller: _emailController),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: CustomFlatButton(label: 'Submit', onPressed: () => {}, fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ),
      )
    );
  }
}
