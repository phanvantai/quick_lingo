import 'package:quick_lingo/core/common/app_info.dart';
import 'package:quick_lingo/core/helpers/utils.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Edit Profile'),
            onTap: () {
              // TODO: Implement edit profile functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Change Password'),
            onTap: () {
              // TODO: Implement change password functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notification Settings'),
            onTap: () {
              // TODO: Implement notification settings functionality
            },
          ),
          FutureBuilder<AppInfo>(
            future: appInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('App Version'),
                  trailing: Text(snapshot.data!.versionNumber),
                );
              } else if (snapshot.hasError) {
                return const ListTile(
                  leading: Icon(Icons.info),
                  title: Text('App Version'),
                  trailing: Text('Error retrieving build'),
                );
              } else {
                return const ListTile(
                  leading: Icon(Icons.info),
                  title: Text('App Version'),
                  trailing: Text('Loading...'),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // TODO: Implement logout functionality
            },
          ),
        ],
      ),
    );
  }
}
