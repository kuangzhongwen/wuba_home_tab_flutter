
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
      child: Text(
          selectCity,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.white
          )
      )
    );
  }
}