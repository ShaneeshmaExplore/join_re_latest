import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:join_re/models/post_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = "http://explorecommunity.com/joinre/api/v1";
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token').toString());
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  Future<List<PostModel>> getSampleData(apiUrl) async {
    var fullUrl = apiUrl;
    // await _getToken();
    final res = await http.get(Uri.parse(fullUrl));
    List body = jsonDecode(res.body);

    return body.map((singleObject) => PostModel.fromJson(singleObject)).toList();
  }

  _setHeaders() => {
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
}
