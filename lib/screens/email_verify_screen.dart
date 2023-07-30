import 'package:flutter/material.dart';

import '/helpers/auth_methods.dart';
import '/screens/login_screen.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  static Route get route => MaterialPageRoute(
        builder: (context) => const EmailVerifyScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () async {
            await AuthMethods().verifyUser();
          },
          child: const Text('send verification email'),
        ),
        TextButton(
          child: const Text('Restart'),
          onPressed: () async {
            await AuthMethods().logout().then(
                  (_) => Navigator.pushReplacement(
                    context,
                    LoginScreen.route,
                  ),
                );
          },
        ),
      ],
    );
  }
}
