import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:soko_beauty/core/constants/cloudinary_constants.dart';

class CloudinaryController {
  Future<dynamic> uploadVideo(
    String filePath,
    // void Function(int) onProgress,
  ) async {
    final url =
        Uri.parse('https://api.cloudinary.com/v1_1/$cloudName/video/upload');

    final request = http.MultipartRequest('POST', url)
      ..fields['upload_preset'] = postPreset
      // ..fields['api_key'] = apiKey
      // ..fields['api_secret'] = apiSecret
      ..files.add(await http.MultipartFile.fromPath('file', filePath));

    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.toBytes();
      final responseString = String.fromCharCodes(responseData);
      final jsonMap = jsonDecode(responseString);

      return jsonMap;
    } else {
      print('Failed!');
      return 'error uploading video';
    }
  }
}
