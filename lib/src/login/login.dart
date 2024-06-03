import 'package:http/http.dart' as http;

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

  if (response.statusCode == 200) {
    print('Request successful');
    print(response.body);
  } else {
    print('Request failed with status: ${response.statusCode}');
    print(response.toString());
    print(response.isRedirect);
    print(response.reasonPhrase);
    print(response.headers);
  }
}
