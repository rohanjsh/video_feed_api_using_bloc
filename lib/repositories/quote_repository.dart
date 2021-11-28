import 'package:api_bloc/repositories/video_api_client.dart';
import 'dart:async';
import 'package:api_bloc/models/models.dart';


class VideoRepository {
  final VideoApiClient videoApiClient;

  VideoRepository({required this.videoApiClient});


  Future<List<Video>> getVideos() async {
    return await videoApiClient.getVideos();
  }
}