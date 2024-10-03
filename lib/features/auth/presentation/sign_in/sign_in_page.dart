import 'package:quick_lingo/core/helpers/injection_container.dart';
import 'package:quick_lingo/core/helpers/shared_preference_helper.dart';
import 'package:quick_lingo/core/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                getIt<SharedPreferenceHelper>().setFirstRun(false);
                // TODO: Implement sign in logic
                GoRouter.of(context).go(AppRoute.main);
              },
              child: const Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
