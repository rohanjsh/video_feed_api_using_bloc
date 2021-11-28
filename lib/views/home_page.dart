import 'package:api_bloc/bloc/bloc.dart';
import 'package:api_bloc/repositories/repository.dart';
import 'package:api_bloc/views/fav_videos.dart';
import 'package:api_bloc/views/all_videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final VideoRepository repository;
  HomePage({
    Key? key,
    required this.repository,
  }) : super(key: key);

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Videos'),
    const Tab(text: 'Favorites'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Awesome Videos'),
          elevation: 0,
          bottom: TabBar(
            tabs: myTabs,
          ),
        ),
        body: BlocProvider(
          create: (context) => VideoBloc(videoRepository: repository),
          child: const TabBarView(
            children: [
              AllVideos(),
              FavVideoList(),
            ],
          ),
        ),
      ),
    );
  }
}
