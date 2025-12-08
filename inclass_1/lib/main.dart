import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    title: "My app",
    home:Scaffold(
      appBar: AppBar(
        title: Text("hello world"),
      ),
      body: Text("แสดงข้อความด้วย Body"),
    ),
    theme: ThemeData(primarySwatch: Colors.cyan),
  );
    runApp(app);
    //print("hello world");
  } 