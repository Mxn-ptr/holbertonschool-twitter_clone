import 'package:flutter/material.dart';
import 'package:twitter/models/user.dart';
import 'package:twitter/providers/auth_state.dart';
import 'package:twitter/screens/signin_screen.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  User? _currentUser;

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();
    auth.getCurrentUserModel();
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/user.jpg'),
                    radius: 50,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _currentUser?.displayName ?? '',
                    style: const TextStyle(
                      color: Color.fromRGBO(143, 143, 143, 0.5),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          '${_currentUser?.followers} Followers',
                          style: const TextStyle(
                            fontSize: 14
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${_currentUser?.following} Following',
                          style: const TextStyle(
                            fontSize: 14
                          ),
                        )
                      ]
                      ),
                  )
                ],
              ),
            )
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                )
            ),
            onTap: () {
              print('Profile clicked');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text(
              'Lists',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                )
            ),
            onTap: () {
              print('Lists clicked');
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text(
              'Bookmark',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                )
            ),
            onTap: () {
              print('Bookmark clicked');
            },
          ),
          ListTile(
            leading: const Icon(Icons.flash_on),
            title: const Text(
              'Moments',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                )
            ),
            onTap: () {
              print('Moments clicked');
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Settings and privacy',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                )
            ),
            onTap: () {
              print('Settings and privacy clicked');
            },
          ),
          ListTile(
            title: const Text(
              'Help Center',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                )
            ),
            onTap: () {
              print('Help Center clicked');
            },
          ),
          ListTile(
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
                )
            ),
            onTap: () async {
              await auth.logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignIn())
              );
            },
          ),
        ],
      ),
    );
  }
}
