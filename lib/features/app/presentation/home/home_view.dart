import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
              width: double.maxFinite,
            ),
            // Recent tickets today
            Text(
              'Recent tickets today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // TODO: Add list of recent tickets today
            SizedBox(height: 16),
            // Recent tickets yesterday
            Text(
              'Recent tickets yesterday',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // TODO: Add list of recent tickets yesterday
            SizedBox(height: 16),
            // Recent tickets last week
            Text(
              'Recent tickets last week',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // TODO: Add list of recent tickets last week
            SizedBox(height: 16),
            // Recent tickets last month
            Text(
              'Recent tickets last month',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // TODO: Add list of recent tickets last month
          ],
        ),
      ),
    );
  }
}
