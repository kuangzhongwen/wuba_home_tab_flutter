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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: AssetImage('images/home_header_tribe_enter_bg.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 8.0, 6.0, 3.0),
              child: Text(
                widget._data != null &&
                        widget._data.data != null &&
                        widget._data.data.length > 0
                    ? '# ' + widget._data.data[0].content
                    : '',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 13.0, color: Colors.white),
              ))
        ],
      ),
    );
  }
}
