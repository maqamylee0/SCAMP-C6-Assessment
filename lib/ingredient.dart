import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shecode/detail.dart';

import 'models/recipe.dart';

class Ingredient extends StatefulWidget {
  final Map data;

  const Ingredient({Key? key , required this.data}) : super(key: key);

  @override
  State<Ingredient> createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                    margin: EdgeInsets.all(4),

                    child: Text('${widget.data['quantity']}${widget.data['measure']}${widget.data['ingredient']}',style: GoogleFonts.roboto(fontSize: 20),),







      );
  }
}
