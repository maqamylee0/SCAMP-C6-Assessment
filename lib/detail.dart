import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shecode/ingredient.dart';
import 'package:shecode/steps.dart';
import 'package:shecode/video.dart';

class Detail extends StatefulWidget {
  final Map data;
  const Detail({Key? key, required  this.data}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('${widget.data['name']} Ingredients',style: TextStyle(fontSize: 20)),
      ),
      body: Container(
        height: 1000,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(10),
              color: Colors.amber
              // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          ),        child: Column(
          children: [
            SizedBox(height: 20,),
            ClipOval(

              child: SizedBox.fromSize(
                size: Size.fromRadius(38), // Image radius
                child: Image.asset('assets/images/recipe.png', fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 10,),

            Expanded(
              flex: 8,

              child: ListTile(
                title: Text('Ingredients',style:GoogleFonts.pacifico(fontSize: 30),),
                 subtitle: ListView.builder(
                     itemCount: widget.data['ingredients']?.length,
                     itemBuilder: (context, index) {
                       return Ingredient( data:widget.data['ingredients'][index] );

                     }
                 )
                 //Text("${widget.data['ingredients']}",style: TextStyle(fontSize: 25),),
              ),
            ),
            // Expanded(
            //   flex: 5,
            //   child:
            //      StackedVideoView(data:widget.data['steps'][0]['videoURL'] ,)
            //    // Text("${widget.data['steps'][0]['videoURL']}",style: TextStyle(fontSize: 25),),
            //
            // ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child:Text("See Steps",style: TextStyle(fontSize: 25),),
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Steps(data : widget.data)),
                      );
                     },
                  ),
                  Container(
                    child: Icon(Icons.arrow_right),
                  ),
                  SizedBox(width: 8,),

                ],
              ),
            )

          ],
        ),
      ),
    ));
  }
}
