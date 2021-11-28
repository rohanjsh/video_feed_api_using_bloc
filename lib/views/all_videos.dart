import 'package:api_bloc/bloc/bloc.dart';
import 'package:api_bloc/models/models.dart';
import 'package:api_bloc/views/video_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

List favourite = [];

class AllVideos extends StatelessWidget {
  const AllVideos({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {

        if(state is VideoEmpty){
          BlocProvider.of<VideoBloc>(context).add(FetchVideo());
        }

        if(state is VideoError){
          return const Center(
            child: Text('Error'),
          );
        }

        if(state is VideoLoaded){
          if(state.videos.isEmpty){
            return const Center(
              child: Text('No Data'),
            );
          }
     
          return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Double Tap & Add to favourites'),
              ],
            ),
            InViewNotifierList(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              // initialInViewIds: const ['0'],
              isInViewPortCondition: (double deltaTop, double deltaBottom,
                  double viewPortDimension) {
                return deltaTop < (0.3 * viewPortDimension) &&
                    deltaBottom > (0.3 * viewPortDimension);
              },
              itemCount: state.videos.length,
              builder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onDoubleTap: () {
                      // print('double tapped');

                      favourite.add(Video(
                          description: state.videos[index].description,
                          subtitle: state.videos[index].subtitle,
                          thumb: state.videos[index].thumb,
                          title: state.videos[index].title,
                          sources: state.videos[index].sources));

                      showCupertinoDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                                title: Text(
                                    '${state.videos[index].title} added to Favourites'),
                                actions: <Widget>[
                                  CupertinoDialogAction(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ));
                    },
                    child: Container(
                      // color: Colors.greenAccent,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        border: Border.all(color: Colors.greenAccent, width: 1),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            // aspectRatio: 1 / 16,
                            height: 200,
                            // width: double.infinity,

                            // color: Colors.greenAccent,

                            // decoration: BoxDecoration(
                            //   border: Border.all(
                            //       color: Colors.greenAccent, width: 1.5),
                            //   borderRadius: BorderRadius.circular(20),
                             
                            // ),

                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return InViewNotifierWidget(
                                  id: '$index',
                                  builder: (BuildContext context,
                                      bool isInView, Widget? child) {
                                    return VideoPlayerWidget(
                                        play: isInView,
                                        url: state.videos[index].sources[0]);
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.videos[index].title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.videos[index].description,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            
          ],
        );


        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );

      }

    );
  }
}



