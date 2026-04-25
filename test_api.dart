import 'dart:convert';
import 'dart:io';

void main() async {
  var url = Uri.parse('https://api.accounts.vikncodes.com/api/v1/users/login');
  var request = await HttpClient().postUrl(url);
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(jsonEncode({
    "username": "Rabeeh@vk",
    "password": "Rabeeh@000",
    "is_mobile": true
  })));
  var response = await request.close();
  var body = await response.transform(utf8.decoder).join();
  File('output.json').writeAsStringSync(body);
}
