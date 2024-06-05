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
  String user = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final loginProviderNotifier = ref.watch(loginProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: customScaffold(
          context: context,
          title: Text('Login',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold)),
          body: BottomBar(child: SafeArea(child: Builder(
            builder: (context) {
              if (loginState.authCookieRequestHeader == null) {
                return AutofillGroup(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          autofillHints: const [AutofillHints.username],
                          initialValue: user,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                            autofillHints: const [AutofillHints.password],
                            initialValue: password,
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
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                backgroundColor:
                                    Theme.of(context).colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                              ),
                              onPressed: () {
                                if (user != '' && password != '') {
                                  loginProviderNotifier.login(
                                      user: user!, password: password!);
                                } else if (user == '') {
                                  final snackBar = SnackBar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.surface,
                                    duration: const Duration(seconds: 1),
                                    content: const Center(
                                        child: Text('Please enter a username',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red,
                                            ))),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else if (password == '') {
                                  final snackBar = SnackBar(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.surface,
                                    duration: const Duration(seconds: 1),
                                    content: const Center(
                                      child: Text('Please enter a password',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red)),
                                    ),
                                  );

                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                              ))),
                      if (loginState.isLoading)
                        const Center(
                            child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircularProgressIndicator(),
                          ],
                        )),
                      if (loginState.error)
                        const Center(
                            child: Text(
                          "Login failed",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )),
                      Expanded(child: Text(''))
                    ],
                  ),
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
                            onPressed: () {
                              ref.read(loginProvider.notifier).logout();
                            },
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
          )))),
    );
  }
}
