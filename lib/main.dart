import 'package:api_bloc/repositories/video_api_client.dart';

import 'package:api_bloc/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:api_bloc/repositories/repository.dart';

import 'package:http/http.dart' as http;



class SimpleBlocObserver extends BlocObserver {

  
  // ignore: annotate_overrides
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // print(transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
 
  const MyApp({Key? key,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(repository: VideoRepository(videoApiClient: VideoApiClient(httpClient: http.Client(),),),),
    );
  }
}

