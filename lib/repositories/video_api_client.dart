import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_bloc/models/models.dart';


class VideoApiClient{

final http.Client httpClient;
  VideoApiClient({
    required this.httpClient,
  });

  Future<List<Video>> getVideos() async {
    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        host: 'api.winkl.in',
        path: '/sample_videos',
      ),
      headers: {
        'Authorization': 'Token ruor7REQi9KJz6wIQKDXvwtt',
      },
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final videos = jsonData['data'];
      // print(videos);

      return videos.map<Video>((json) => Video.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load videos');
    }
  }

}