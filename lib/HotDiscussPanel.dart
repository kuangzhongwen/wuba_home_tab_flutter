import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wuba_home_tab_flutter/HomeMock.dart';
import 'package:wuba_home_tab_flutter/HotDiscussBean.dart';
import 'package:wuba_home_tab_flutter/UIConstants.dart';

class HotDiscussPanel extends StatefulWidget {
  @override
  State createState() {
    return _HotDiscussPanelState();
  }
}

class _HotDiscussPanelState extends State<HotDiscussPanel> {

  HotDiscussBean _hotDiscuss;

  @override
  void initState() {
    _ReceiveData();
  }

  void _ReceiveData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _hotDiscuss = HomeMock.loadHotDiscuss();
        print("xxxxx" + _hotDiscuss.topic);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 30,
              child: Row(
                children: <Widget>[
                  Image.asset('images/home_hot_discuss.png',
                      width: 37, height: 18),
                  Text(
                    _hotDiscuss != null ? _hotDiscuss.topic : '',
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: TextStyle(fontSize: 18.0, color: Color(UIConstants.PRIMARY_TEXT_COLOR)),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
