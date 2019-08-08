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
  RefreshController _refreshController1 =
  RefreshController(initialRefreshStatus: RefreshStatus.twoLeveling);
  RefreshController _refreshController2 = RefreshController();
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
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
                    icon: Icon(Icons.add), title: Text("二级刷新例子1")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.border_clear), title: Text("二级刷新例子2"))
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
                          height: 80.0,
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
                                Center(
                                  child: Wrap(
                                    children: <Widget>[
                                      RaisedButton(
                                        color: Colors.greenAccent,
                                        onPressed: () {},
                                        child: Text("登陆"),
                                      ),
                                    ],
                                  ),
                                ),
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
