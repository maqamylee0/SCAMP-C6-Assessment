import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shecode/video.dart';
import 'package:shecode/watch.dart';

class Steps extends StatefulWidget {
  final Map data;
  const Steps({Key? key,required  this.data}) : super(key: key);

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
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
            SizedBox(height: 10,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child:Text("Watch Video",style: TextStyle(fontSize: 25),),
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Watch(data : widget.data)),
                      );
                    },
                  ),
                  Container(
                    child: Icon(Icons.arrow_right),
                  ),
                  SizedBox(width: 8,),

                ],
              ),
            ),
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child:Text("Watch Video",style: TextStyle(fontSize: 25),),
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Watch(data : widget.data)),
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
        )

      ),
    ));
  }
}
