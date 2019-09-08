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

  static String subTribeContent(String content) {
    if (content != null && content.length > 12) {
      return content.substring(0, 12) + '..';
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
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
                widget._data != null &&
                        widget._data.data != null &&
                        widget._data.data.length > 0
                    ? '# ' + subTribeContent(widget._data.data[0].content)
                    : '',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(13.0, 2.0, 2.0, 2.0),
              child: new ClipOval(
                  child: new FadeInImage.assetNetwork(
                placeholder: "images/normal_user_icon.webp", // 预览图
                 fit: BoxFit.fitWidth,
                image: widget._data != null &&
                        widget._data.data != null &&
                        widget._data.data.length > 0
                    ? widget._data.data[0].userHead
                    : '',
                width: 26.0,
                height: 26.0,
              )))
        ],
      ),
    );
  }
}
