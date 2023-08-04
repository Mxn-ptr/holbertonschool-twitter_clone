import 'package:flutter/material.dart';
import 'package:twitter/assets/user_data.dart';
import 'package:twitter/widgets/entry_field.dart';
import 'package:twitter/widgets/users_search_results_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('images/user.jpg'),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomEntryField(
                    hint: 'Search',
                    controller: _searchController,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.blue),
                  onPressed: () {
                      print('Settings Button Clicked');
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];
                return UsersSearchResultsWidget(
                  name: user['name'],
                  username: user['username'],
                  bio: user['bio'],
                  imgUrl: user['imgUrl'],
                  isVerified: user['isVerified'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
