import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:kt_gif_refresher/kt_gif_refresher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print('22222');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: KTGifRefresher(
          controller: _refreshController,
          scrollController: _scrollController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            _refreshController.refreshCompleted();
          },
          onLoading: () async {
            await Future.delayed(Duration(seconds: 1));
            _refreshController.loadComplete();
          },
          child: ListView.builder(
              controller: _scrollController,
              itemCount: 50,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text('$index'),
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
