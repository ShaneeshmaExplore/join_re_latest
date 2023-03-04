import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
class Service {
  Future<bool> addImage(int id,String type,String profile_img, String filepath) async {
    String addimageUrl = 'http://explorecommunity.com/joinre/api/v1/imageadd';
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var request = http.MultipartRequest('POST', Uri.parse(addimageUrl));
    // request.fields.addAll(body);
    request.fields["user_id"] = jsonEncode(id) ;
    request.fields["image_video"] = type;
    request.fields["profile_img"] = profile_img;
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile('path',
        File(filepath).readAsBytes().asStream(), File(filepath).lengthSync(),
        filename: filepath.split("/").last));
      // ..files.add(await http.MultipartFile.fromPath('path', filepath));



    var response = await request.send();

    var rspd = await http.Response.fromStream(response);
    final rspData = json.decode(json.encode(rspd.body));
    print("oxoxoxoxoxoxoxoxoxoxoxoxoxoxoxxo");

    print( response.statusCode);
    if (response.statusCode == 200) {

      return true;
    } else {
      return false;
    }
  }
}