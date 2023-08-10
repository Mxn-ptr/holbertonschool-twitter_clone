import 'package:flutter/material.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/providers/share_state.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SharedState()),
        ChangeNotifierProvider(create: (_) => Auth())
      ],
      child: const MaterialApp(
        home: SignIn(),
      ),
    );
  }
}
