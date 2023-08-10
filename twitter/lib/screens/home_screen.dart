import 'package:flutter/material.dart';
import 'package:twitter/assets/post_data.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/signin_screen.dart';
import 'package:twitter/widgets/post_widget.dart';
import '../widgets/side_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // GlobalKey to control the Scaffold state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    final isLoggedIn = Auth().checkAuth();
    if (!isLoggedIn) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        title: const Text('Home', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: const SideBarMenu(),
      body: ListView.builder(
        itemCount: postList.length,
        itemBuilder: (context, index) {
          final post = postList[index];
          return PostWidget(
            title: 'Post $index',
            content: post['content'],
            userAvatarUrl: post['userAvatarUrl'],
            userName: post['userName'],
            isVerified: post['isVerified'],
            username: post['username'],
            hoursAgo: post['hoursAgo'],
            commentsCount: post['commentsCount'],
            transferCount: post['transferCount'],
            loveCount: post['loveCount'],
          );
        },
      ),
    );
  }
}
