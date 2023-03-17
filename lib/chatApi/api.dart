import 'dart:convert';
import 'dart:async';
// import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

ask(message) async {
  // 设置OpenAI API密钥
  const apiKey = '';

  // 设置API URL
  const apiUrl = 'https://api.openai.com/v1/chat/completions';

  Map<String, dynamic> requestBody = {
    'model': "gpt-3.5-turbo",
    'messages': [
      {'role': "user", 'content': message}
    ],
    'temperature': 0.7,
    'top_p': 1,
    'frequency_penalty': 0,
    'presence_penalty': 0,
    'max_tokens': 1536,
    'stream': false,
    'n': 1,
  };

  // 发起HTTP POST请求
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      "Content-Type": "application/json; charset=utf-8",
      'Authorization': 'Bearer $apiKey'
    },
    body: jsonEncode(requestBody),
  );

  // var request = http.Request(
  //   "post",
  //   Uri.parse(apiUrl),
  // )
  //   ..body = jsonEncode(requestBody)
  //   ..headers["content-type"] = "application/json; charset=utf-8"
  //   ..headers["Authorization"] = "Bearer $apiKey";
  // StreamedResponse response = await http.Client().send(request);
  // return response.stream;

  response.headers["content-type"] = "application/json; charset=utf-8";
  final jsonResponse = jsonDecode(response.body);
  final result = jsonResponse['choices'][0]['message']['content'];
  return (result);
}
