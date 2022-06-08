import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shecode/detail.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/recipe.dart';

class Item extends StatefulWidget {
  final Map data;

  const Item({Key? key , required this.data}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return
       Card(
           color: Colors.amber,

           shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),

        ),
        child:Container(
          height: 150,
          margin: EdgeInsets.all(20),
          // decoration: BoxDecoration(
          //   borderRadius:BorderRadius.circular(30),
          //     // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
          // ),
          child: Row(
            children: [
              Column(

                children: [
                  SizedBox(height: 10),

                  Container(
                    margin: EdgeInsets.all(5),

                    child: Text('${widget.data['name']}',style: GoogleFonts.pacifico(fontSize: 20),),

                  ),
                  SizedBox(height: 10),
                  ClipOval(

                    child: SizedBox.fromSize(
                      size: Size.fromRadius(28), // Image radius
                      child: Image.asset('assets/images/recipe.png', fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),

              // Center(
              //   child: Padding(
              //     padding: EdgeInsets.all(10),
              //     child: Expanded(
              //       child:Image.asset("${widget.data['image']}"),
              //       flex:2 ,
              //     ),
              //   ),
              // ),
              Expanded(
                child:Container(
                  alignment: Alignment.topLeft,
                  child: Column(

                    children: [
                      Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text('Servings',style:GoogleFonts.roboto(fontSize: 20)),
                          subtitle: Text("${widget.data['servings']}plates",style: GoogleFonts.roboto(fontSize: 20),),
                        ),
                      ),

                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child:Text("Visit recipe",style: TextStyle(fontSize: 15),),
                              onPressed: ()
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Detail(data : widget.data)),
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
                flex:8 ,
              ),
            ],
          ),
        ),
        elevation: 8,


    );
  }
}
