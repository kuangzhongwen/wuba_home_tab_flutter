import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wuba_home_tab_flutter/TribeEnterBean.dart';

class TribeEnterView extends StatefulWidget {
  TribeEnterBean _data;

  TribeEnterView(this._data);

  @override
  State createState() {
    return _TribeEnterViewState();
  }
}

class _TribeEnterViewState extends State<TribeEnterView> {
  TribeBean _currentTribe;

  Timer _timer;

  @override
  void dispose() {
    cancelTimer();
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  static String subTribeContent(String content) {
    if (content != null && content.length > 12) {
      return content.substring(0, 12) + '..';
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    if (widget._data != null &&
        widget._data.data != null &&
        widget._data.data.length > 0) {
      cancelTimer();
      int curIndex = 0;
      int total = widget._data.data.length;
      const period = const Duration(seconds: 2);
      _timer = Timer.periodic(period, (timer) {
        if (curIndex == total - 1) curIndex = 0;
        setState(() {
          _currentTribe = widget._data.data[curIndex];
        });
        curIndex++;
      });
    }

    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: AssetImage('images/home_header_tribe_enter_bg.png'),
            fit: BoxFit.fill),
      ),
      child: Row(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 1.0, 2.0, 2.0),
              child: Text(
                _currentTribe != null
                    ? '# ' + subTribeContent(_currentTribe.content)
                    : '',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(13.0, 2.0, 2.0, 2.0),
              child: new ClipOval(
                  child: new FadeInImage.assetNetwork(
                placeholder: "images/normal_user_icon.webp",
                fit: BoxFit.fitWidth,
                image: _currentTribe != null ? _currentTribe.userHead : '',
                width: 26.0,
                height: 26.0,
              )))
        ],
      ),
    );
  }
}
