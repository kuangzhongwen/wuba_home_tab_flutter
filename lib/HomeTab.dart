import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wuba_home_tab_flutter/HotDiscussPanel.dart';
import 'package:wuba_home_tab_flutter/SelectCityText.dart';
import 'package:wuba_home_tab_flutter/HomeBusinessPanel.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  final Key linkKey = GlobalKey();

  bool dismissAppbar = false;

  List<String> data = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];

  @override
  void initState() {
    _scrollController.addListener(() {
      final bool ifdismissAppbar = _scrollController.offset >= 136.0;
      if (dismissAppbar != ifdismissAppbar) {
        if (mounted) setState(() {});
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
                  top: -80.0,
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
                            child: Stack(children: <Widget>[
                          Image.asset("images/home_page_bg.png",
                              fit: BoxFit.fitWidth),
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 180, 10, 0),
                              width: MediaQuery.of(context).size.width,
                              child: Column(children: <Widget>[
                                SelectCityText(),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: HomeBussinessPanel())),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10.0, 0.0, 0.0),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.white,
                                            child: HotDiscussPanel())))
                              ]))
                        ]))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 64.0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: dismissAppbar ? 1.0 : 0.0,
                title: LinkBar(key: linkKey),
              ),
            )
          ],
        ),
      ),
      maxOverScrollExtent: 100,
    );
  }
}

class LinkBar extends StatefulWidget {
  LinkBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LinkBarState();
  }
}

class _LinkBarState extends State<LinkBar>
    with RefreshProcessor, SingleTickerProviderStateMixin {
  RefreshStatus _status = RefreshStatus.idle;
  AnimationController _animationController;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  Future endRefresh() {
    _animationController.animateTo(0.0, duration: Duration(milliseconds: 300));
    return Future.value();
  }

  @override
  void onOffsetChange(double offset) {
    if (_status != RefreshStatus.refreshing)
      _animationController.value = offset / 80.0;
    super.onOffsetChange(offset);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      child: CupertinoActivityIndicator(),
      scale: _animationController,
    );
  }

  @override
  void onModeChange(RefreshStatus mode) {
    super.onModeChange(mode);
    _status = mode;
    setState(() {});
  }
}
