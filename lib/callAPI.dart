import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> predictImage(List<int> imageBytes) async {
  final url = Uri.parse('https://optiscan360.azurewebsites.net/predict/'); // Replace with your actual API URL
  final request = http.MultipartRequest('POST', url);
  request.files.add(http.MultipartFile.fromBytes('image', imageBytes, filename: 'image.jpg'));
  final response = await request.send();

  if (response.statusCode == 200) {
    final responseData = await response.stream.bytesToString();
    final decodedData = jsonDecode(responseData);
    return decodedData['result'];
  } else {
    return "error";
    // Handle API errors here (e.g., show an error message to the user)
  }
}

