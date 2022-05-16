import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SecondPageState();
  }
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //布局结构
        appBar: AppBar(),
        backgroundColor: Colors.purple,
        body: Container(
          child: Text('第二页'),
        ));
  }
}
