import 'package:api_bloc/bloc/video_event.dart';
import 'package:api_bloc/bloc/video_state.dart';
import 'package:api_bloc/repositories/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository videoRepository;

  VideoBloc({required this.videoRepository}) : super(VideoEmpty());

  // ignore: annotate_overrides
  Stream<VideoState> mapEventToState(VideoEvent event) async* {
    if (event is FetchVideo) {
      yield VideoLoading();
      try {
        final videos = await videoRepository.getVideos();
        yield VideoLoaded(videos: videos);
      } catch (_) {
        yield VideoError();
      }
    }
  }

  
}