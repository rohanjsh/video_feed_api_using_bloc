
import 'package:equatable/equatable.dart';
import 'package:api_bloc/models/models.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoEmpty extends VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final List<Video> videos;

  const VideoLoaded({required this.videos});

  @override
  List<Object> get props => [videos];


}

class VideoError extends VideoState {}


