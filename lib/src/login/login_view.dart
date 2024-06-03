import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/scaffold.dart' show customScaffold;
import '../feed/bottom_bar.dart' show BottomBar;
import 'login.dart' show login;

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  String? user;
  String? password;

  @override
  Widget build(BuildContext context) {
    return customScaffold(
        context: context,
        title: Text('Login',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
        body: BottomBar(
            child: SafeArea(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                onChanged: (text) {
                  setState(() {
                    user = text;
                  });
                },
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      password = text;
                    });
                  },
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () => {
                          if (user != null && password != null)
                            {login(user: user!, password: password!)}
                        },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )))
          ],
        ))));
  }
}
