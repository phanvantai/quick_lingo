import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace with the actual number of notifications
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Notification $index'),
            subtitle: const Text('This is a notification'),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}
