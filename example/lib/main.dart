import 'package:flutter/material.dart';
import 'dart:async';
import 'package:kt_gif_refresher/kt_gif_refresher.dart';
import 'package:kt_gif_refresher_example/second_page.dart';

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
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          actions: [
            GestureDetector(
              onTap: () {
                _scrollController.jumpTo(0);
                _refreshController.requestRefresh(needMove: true);
              },
              child: Container(
                color: Colors.transparent,
                width: 55,
                height: 49,
                alignment: Alignment.center,
                child: Text(
                  'Top',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            )
          ],
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
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => SecondPage(),
                    ));
                  },
                  child: Column(
                    children: [
                      Container(
                        color: Colors.transparent,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text('$index'),
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
