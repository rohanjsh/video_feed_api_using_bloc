import 'package:api_bloc/views/video_widget.dart';
import 'package:api_bloc/views/all_videos.dart';

import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';

class FavVideoList extends StatelessWidget {
  const FavVideoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        if (favourite.isEmpty)
          const Center(
            child: Text('Ohh! You didn\'t favourite any of the videos 😕'),
          ),

        InViewNotifierList(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          // initialInViewIds: const ['0'],
          isInViewPortCondition:
              (double deltaTop, double deltaBottom, double viewPortDimension) {
            return deltaTop < (0.3 * viewPortDimension) &&
                deltaBottom > (0.3 * viewPortDimension);
          },
          itemCount: favourite.length,
          builder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                // color: Colors.greenAccent,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 0.5,
                      // / changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      // aspectRatio: 1 / 16,
                      height: 200,
                      width: double.infinity,
                      // color: Colors.greenAccent,
                      padding: const EdgeInsets.all(1.5),

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return InViewNotifierWidget(
                              id: '$index',
                              builder: (BuildContext context, bool isInView,
                                  Widget? child) {
                                return VideoPlayerWidget(
                                    play: isInView,
                                    url: favourite[index].sources[0]);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      favourite[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      favourite[index].description,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        // Align(
        //   alignment: Alignment.center,
        //   child: Container(
        //     height: 1.0,
        //     color: Colors.redAccent,
        //   ),
        // )
      ],
    );
  }
}
