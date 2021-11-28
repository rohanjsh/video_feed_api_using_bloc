import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable{

  const VideoEvent();

}


class FetchVideo extends VideoEvent{

  @override
  List<Object> get props => [];

}
