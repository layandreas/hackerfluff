import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/scaffold.dart' show customScaffold;
import '../feed/bottom_bar.dart' show BottomBar;
import 'login_provider.dart';

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
    final loginState = ref.watch(loginProvider);
    final loginProviderNotifier = ref.watch(loginProvider.notifier);

    return customScaffold(
        context: context,
        title: Text('Login',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold)),
        body: BottomBar(child: SafeArea(child: Builder(
          builder: (context) {
            if (loginState == null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            side: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary),
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            //side: BorderSide(width: 2, color: Colors.green),
                          ),
                          onPressed: () => {
                                if (user != null && password != null)
                                  {
                                    loginProviderNotifier.login(
                                        user: user!, password: password!)
                                  }
                              },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          )))
                ],
              );
            } else {
              return Column(
                children: [
                  Text("Logged in as: ${loginState.user}"),
                  Center(
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 40),
                            side: BorderSide(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary),
                            backgroundColor:
                                Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            //side: BorderSide(width: 2, color: Colors.green),
                          ),
                          onPressed: () =>
                              {ref.read(loginProvider.notifier).logout()},
                          child: Text(
                            'Logout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary),
                          )))
                ],
              );
            }
          },
        ))));
  }
}
