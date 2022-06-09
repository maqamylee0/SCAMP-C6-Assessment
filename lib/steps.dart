import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shecode/video.dart';
import 'package:video_player/video_player.dart';

class Steps extends StatefulWidget {
  final Map data;
  const Steps({Key? key,required  this.data}) : super(key: key);

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      '${ widget.data['steps'][0]['videoURL']}',
    );
    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('${widget.data['name']} Steps',style: TextStyle(fontSize: 20)),
      ),

      body: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(15),
            color: Colors.amber
          // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        ),
        child:Column(
          children: [
            Container(
              child:  FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(height: 10,),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       TextButton(
            //         child:Text("Watch Video",style: TextStyle(fontSize: 25),),
            //         onPressed: ()
            //         {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) =>  VideoPlayerScreen(data : widget.data['steps'][0]['videoURL'])),
            //           );
            //         },
            //       ),
            //       Container(
            //         child: Icon(Icons.arrow_right),
            //       ),
            //       SizedBox(width: 8,),
            //
            //     ],
            //   ),
            // ),
          Expanded(

            child: ListTile(

                subtitle:ListView.builder(
                    itemCount: widget.data['steps']?.length,
                    itemBuilder: (context, index) {
                      return Column(

                        children: [

                          Text('${widget.data['steps'][index]['shortDescription']}',style: GoogleFonts.pacifico(fontSize: 25),),
                          SizedBox(height: 15),
                          Text('${widget.data['steps'][index]['description']}',style:GoogleFonts.roboto(fontSize: 20),),


                        ],
                      );

                    }
                )
            ),
          ),
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       TextButton(
            //         child:Text("Watch Video",style: TextStyle(fontSize: 25),),
            //         onPressed: ()
            //         {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(builder: (context) =>  VideoPlayerScreen(data : widget.data['steps'][0]['videoURL'])),
            //           );
            //         },
            //       ),
            //       Container(
            //         child: Icon(Icons.arrow_right),
            //       ),
            //       SizedBox(width: 8,),
            //
            //     ],
            //   ),
            // )
          ],
        )

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // pause
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // play
              _controller.play();
            }
          });
        },
        // icon
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    ));
  }
}
