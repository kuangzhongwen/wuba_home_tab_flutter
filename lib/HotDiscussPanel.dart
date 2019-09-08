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
                  Padding(
                      padding: UIConstants.HOT_DISCUSS_EI,
                      child: Text(_hotDiscuss != null ? _hotDiscuss.topic : '',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Color(UIConstants.PRIMARY_TEXT_COLOR))))
                ],
              )),
          Padding(
              padding: UIConstants.HOT_DISCUSS_EI,
              child: Divider(
                height: UIConstants.DIVIDER_H,
                color: Color(UIConstants.DIVIDER_COLOR),
              )),
          Padding(
              padding: UIConstants.HOT_DISCUSS_EI,
              child: SizedBox(height: 150.0, child: _HotDiscussGridView(_hotDiscuss))
          )
        ],
      ),
    );
  }
}

class _HotDiscussGridView extends StatefulWidget {
  final HotDiscussBean _data;

  _HotDiscussGridView(this._data);

  @override
  _HotDiscussGridViewState createState() => new _HotDiscussGridViewState();
}

class _HotDiscussGridViewState extends State<_HotDiscussGridView> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 1),
        physics: NeverScrollableScrollPhysics(),
        itemCount: widget._data != null && widget._data.hots != null ? widget._data.hots.length : 0,
        itemBuilder: (context, index) {
          return _HotDiscussItemView(hot: widget._data.hots[index]);
        });
  }
}

class _HotDiscussItemView extends StatefulWidget {
  final HotDiscussItemBean hot;

  _HotDiscussItemView({this.hot});

  @override
  _HotDiscussItemState createState() => _HotDiscussItemState();
}

class _HotDiscussItemState extends State<_HotDiscussItemView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(widget.hot.image, width: 25, height: 25),
            Padding(
                padding: const EdgeInsets.fromLTRB(4, 0.0, 0.0, 0.0),
                child: Text(widget.hot.title,
                    style: new TextStyle(
                        fontSize: 15.0, height: 1.0, color: Color(UIConstants.PRIMARY_TEXT_DARK_COLOR)
                    )
                )
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
            child: Text(widget.hot.desc + ' >',
                style: new TextStyle(
                    fontSize: 13.0, height: 1.0, color: Color(UIConstants.PRIMARY_TEXT_LIGHT_COLOR)
                )
            )
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
