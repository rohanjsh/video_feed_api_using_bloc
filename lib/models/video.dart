import 'package:equatable/equatable.dart';

class Video extends Equatable {
  
  final String title;
  final String subtitle;
  final String thumb;
  final String description;
  final List<String> sources;
  // final int videoCount;

  const Video({
    // required this.videoCount,
    required this.title,
    required this.subtitle,
    required this.thumb,
    required this.description,
    required this.sources,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      // videoCount: json['video_count'] as int,
      title: json['title'],
      subtitle: json['subtitle'],
      thumb: json['thumb'],
      description: json['description'],
      sources: json['sources'].cast<String>(),
    );
  }

  @override
  List<Object> get props => [
    // videoCount,
    title,
    subtitle,
    thumb,
    description,
    sources,
  ];

  @override
  String toString() {
    return 'Video { title: $title, subtitle: $subtitle, thumb: $thumb, description: $description, sources: $sources }';
  }


}
