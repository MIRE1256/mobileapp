import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:"MyApp",
        home:MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator"),),
          body: Center(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Text(
                  num.toString(),style: TextStyle(fontSize: 40),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: (){setState(() {num = 7;});},child: Text("7"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){setState(() {num = 8;});},child: Text("8"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){setState(() {num = 9;});},child: Text("9"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){},child: Text("+"),),SizedBox(width: 10,),
                    ],),
                SizedBox(height: 10,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: (){setState(() {num = 4;});},child: Text("4"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){setState(() {num = 5;});},child: Text("5"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){setState(() {num = 6;});},child: Text("6"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){},child: Text("-"),),SizedBox(width: 10,),
                    ],),
                SizedBox(height: 10,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: (){setState(() {num = 1;});},child: Text("1"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){setState(() {num = 2;});},child: Text("2"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){setState(() {num = 3;});},child: Text("3"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){},child: Text("*"),),SizedBox(width: 10,),
                    ],),
                SizedBox(height: 10,),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(onPressed: (){setState(() {num = 0;});},child: Text("0"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){},child: Text("C"),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){},child: Text("="),),SizedBox(width: 10,),
                    FloatingActionButton(onPressed: (){},child: Text("/"),),SizedBox(width: 10,),
                    ],),
              ],
            ),
          ),
        );
  }
}