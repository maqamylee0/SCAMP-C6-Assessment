import 'package:flutter/cupertino.dart';
import 'package:shecode/video.dart';

class Watch extends StatefulWidget {
  final Map data;
  const Watch({Key? key, required  this.data}) : super(key: key);

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Expanded(
    child:
    StackedVideoView(data:widget.data['steps'][0]['videoURL'] ,)
    // Text("${widget.data['steps'][0]['videoURL']}",style: TextStyle(fontSize: 25),),

    )
      ],
    );
  }
}
