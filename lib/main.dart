import 'package:flutter/material.dart';

import 'appScreens/note_details.dart';
import 'appScreens/note_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(title: 'Note Keeper',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home: NoteList(),
    );
  }

}

  // This widget is the root of your application.
  