import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'Item.dart';

class HomeTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeTabPageState();
  }
}

class _HomeTabPageState extends State<HomeTabPage> {
  RefreshController _refreshController = RefreshController();
  final Key linkKey = GlobalKey();
  List<String> data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
  final ScrollController _scrollController = ScrollController();
  bool dismissAppbar = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      final bool ifdismissAppbar = _scrollController.offset >= 136.0;
      if (dismissAppbar != ifdismissAppbar) {
        if (mounted)
          setState(() {});
      }
      dismissAppbar = ifdismissAppbar;
    });
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: -150.0,
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: SmartRefresher(
                    controller: _refreshController,
                    header: LinkHeader(linkKey: linkKey),
                    onRefresh: () async {
                      await Future.delayed(Duration(milliseconds: 3000));
                      _refreshController.refreshCompleted();
                    },
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Image.asset(
                            "images/home_page_bg.png",
                            fit: BoxFit.cover
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildBuilderDelegate(
                              (c, i) => Item(
                                    title: data[i],
                                  ),
                              childCount: data.length),
                          itemExtent: 100.0,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      maxOverScrollExtent: 100,
    );
  }
}
