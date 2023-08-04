import 'package:flutter/material.dart';

class UsersSearchResultsWidget extends StatelessWidget {
  final String name;
  final String username;
  final String bio;
  final String imgUrl;
  final bool isVerified;

  const UsersSearchResultsWidget({super.key,
    required this.name,
    required this.username,
    required this.bio,
    required this.imgUrl,
    required this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(imgUrl),
      ),
      title: Text(
        name,
        style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bio,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Text(username),
        ],
      ),
      trailing: isVerified ? const Icon(Icons.verified, color: Colors.blue) : const SizedBox(),
      onTap: () {
      },
    );
  }
}
