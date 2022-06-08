
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

import 'models/videomodel.dart';

class StackedVideoView extends StatefulWidget {
  final String data;
  const StackedVideoView({Key? key,  required this.data}) : super(key: key);

  @override
  State<StackedVideoView> createState() => _StackedVideoViewState();
}

class _StackedVideoViewState extends State<StackedVideoView> {
  @override



  Widget build(BuildContext context) {
    return ViewModelBuilder<StackedVideoViewModel>.reactive(
      viewModelBuilder: () => StackedVideoViewModel(),
      onModelReady: (model) {
        model.initialize('${widget.data}');
      },
      builder: (context, model, child) {

        return SizedBox(
          width: model.videoPlayerController.value.size.width,
          height: model.videoPlayerController.value.size.height,
            // height: model.videoPlayerController.value.size.height ?? 0,
            // width: model.videoPlayerController.value.size.width ?? 0,
              child:AspectRatio(
            aspectRatio: model.videoPlayerController.value.aspectRatio,
            child:GestureDetector(
                onTap: () =>
                model.videoPlayerController.value.isPlaying
                    ? model.pauseVideo()
                    : model.playVideo(),
              ),),
        );


      },
    );
  }
}