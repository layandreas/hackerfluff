import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'login_state_model.dart' show LoginState;
// Necessary for code-generation to work
part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
class Login extends _$Login {
  @override
  LoginState? build() {
    const LoginState? state = null;
    return state;
  }

  void login({required String user, required String password}) async {
    var url = Uri.parse('https://news.ycombinator.com/login');
    var headers = {
      'accept':
          'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7',
      'accept-language': 'en-GB,en;q=0.9',
      'cache-control': 'max-age=0',
      'content-type': 'application/x-www-form-urlencoded',
      'origin': 'https://news.ycombinator.com',
      'priority': 'u=0, i',
      'referer': 'https://news.ycombinator.com/',
      'sec-ch-ua':
          '"Google Chrome";v="125", "Chromium";v="125", "Not.A/Brand";v="24"',
      'sec-ch-ua-mobile': '?0',
      'sec-ch-ua-platform': '"macOS"',
      'sec-fetch-dest': 'document',
      'sec-fetch-mode': 'navigate',
      'sec-fetch-site': 'same-origin',
      'sec-fetch-user': '?1',
      'upgrade-insecure-requests': '1',
      'user-agent':
          'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36',
    };

    var body = 'goto=news&acct=$user&pw=$password';
    var response = await http.post(url, headers: headers, body: body);

    final responseHeaders = response.headers;
    final authCookie = responseHeaders["set-cookie"];

    if (authCookie != null) {
      final authCookieRequestHeader = "cookie: ${authCookie.split(";").first}";
      final loginState = LoginState(
          user: user, authCookieRequestHeader: authCookieRequestHeader);
      state = loginState;
    }
  }

  void logout() {
    state = null;
  }
}
