import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shecode/item.dart';
import 'models/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        fontFamily: ' Raleway',

        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Recipe Book'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   late List recipes;
  Future<List> getRecipes() async {
    String recipeURL =
        'https://d17h27t6h515a5.cloudfront.net/topher/2017/May/59121517_baking/baking.json';
    final response = await http.get(
        Uri.parse(recipeURL)
    );

    if (response.statusCode == 200) {
       recipes = jsonDecode(response.body);
      print(recipes);
      return recipes;
    } else {
      throw "Unable to retrieve recipes";
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('Recipe Book'),
      ),
      body:

           Container(
             margin: EdgeInsets.all(10),
             child: FutureBuilder<List>(
               future: getRecipes(),
               builder: (context, snapshot) {

                 if (snapshot.hasData) {
                   return  ListView.builder(
                       itemCount: snapshot.data?.length,
                       itemBuilder: (context, index) {
                         return Item( data:snapshot.data![index] );

                       }
                   );
                 } else if (snapshot.hasError) {
                   return  Text("${snapshot.error}");
                 }

                 // By default, show a loading spinner
                 return  const CircularProgressIndicator();
               },
             ),
           ),
    ),
    );

  }

}
