import 'package:flutter/material.dart';
import 'package:netflix/src/ui/home_page.dart';

void main() {
  runApp(Netflix());
}


class Netflix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Movie List',
      theme:ThemeData(
        primarySwatch: Colors.red,

      ),
      home:HomePage()

    );
  }
}
