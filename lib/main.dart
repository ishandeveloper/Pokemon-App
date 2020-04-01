import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'homepage.dart';

void main() => runApp(MaterialApp(
      title: "Hello World",
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.red),
    ));

