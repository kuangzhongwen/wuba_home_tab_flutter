import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    hide RefreshIndicator, RefreshIndicatorState;
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WubaTwoLevel extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _WubaTwoLevelState();
  }
}

class _WubaTwoLevelState extends State<WubaTwoLevel> {
  // 初始化在 2 楼
  RefreshController _refreshController1 = RefreshController(initialRefreshStatus: RefreshStatus.twoLeveling);
  RefreshController _refreshController2 = RefreshController();
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  /// 根据名称加载图片
  static Widget _image(String iconName) {
    return Image.asset(
      'images/${iconName}.png',
      width: 24,
      height: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      enableScrollWhenTwoLevel: true,
      maxOverScrollExtent: 120,
      child: LayoutBuilder(
        builder: (q, c) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _tabIndex,
              onTap: (index) {
                _tabIndex = index;
                if (mounted) setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: _image("wb_home_tap_index_normal"), title: Text("首页"), activeIcon: _image("wb_home_tap_index_pressed")),
                BottomNavigationBarItem(
                    icon: _image("wb_home_tap_history_normal"), title: Text("发现"), activeIcon: _image("wb_home_tap_history_pressed"))
              ],
            ),
            body: Stack(
              children: <Widget>[
                Offstage(
                  offstage: _tabIndex != 0,
                  child: LayoutBuilder(
                    builder: (_, c) {
                      return SmartRefresher(
                        header: ClassicHeader(
                          textStyle: TextStyle(color: Colors.white),
                          height: 120.0,
                          outerBuilder: (child) {
                            return Container(
                              height: c.biggest.height,
                              child: _refreshController1.headerStatus !=
                                  RefreshStatus.twoLeveling &&
                                  _refreshController1.headerStatus !=
                                      RefreshStatus.twoLevelOpening &&
                                  _refreshController1.headerStatus !=
                                      RefreshStatus.twoLevelClosing
                                  ? Container(
                                height: 60.0,
                                alignment: Alignment.center,
                                child: child,
                              )
                                  : child,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "images/secondfloor.jpg",
                                      ),
                                      fit: BoxFit.cover)),
                              alignment: Alignment.bottomCenter,
                            );
                          },
                          twoLevelView: Container(
                            height: c.biggest.height,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 60.0,
                                  child: GestureDetector(
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      _refreshController1.twoLevelComplete();
                                    },
                                  ),
                                  alignment: Alignment.bottomLeft,
                                ),
                              ],
                            ),
                          ),
                        ),
                        controller: _refreshController1,
                        enableTwoLevel: true,
                        enablePullDown: true,
                        onRefresh: () async {
                          await Future.delayed(Duration(milliseconds: 2000));
                          _refreshController1.refreshCompleted();
                        },
                        onTwoLevel: () {},
                      );
                    },
                  ),
                ),
                Offstage(
                  offstage: _tabIndex != 1,
                  child: SmartRefresher(
                    header: ClassicHeader(),
                    controller: _refreshController2,
                    enableTwoLevel: true,
                    onRefresh: () async {
                      await Future.delayed(Duration(milliseconds: 2000));
                      _refreshController2.refreshCompleted();
                    },
                    onTwoLevel: () {
                      print("Asd");
                      _refreshController2.position.hold(() {});
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (c) => Scaffold(
                            appBar: AppBar(),
                            body: Text("二楼刷新"),
                          )))
                          .whenComplete(() {
                        _refreshController2.twoLevelComplete(
                            duration: Duration(microseconds: 1));
                      });
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
