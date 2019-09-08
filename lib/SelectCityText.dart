import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCityText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectCityState();
  }
}

class _SelectCityState extends State<SelectCityText> {
  String selectCity = '北京';

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      GestureDetector(
          onTap: () {
            print("onTap city text.");
          },
          child: Text(
            selectCity,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          )),
      Padding(
          padding: const EdgeInsets.fromLTRB(5, 0.0, 0.0, 0.0),
          child: Image.asset("images/ic_location_down_white.png",
              width: 13, height: 13))
    ]);
  }
}
