
import 'package:flutter/cupertino.dart';

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
    return Text(
      selectCity,
      textAlign: TextAlign.start,
      textDirection: TextDirection.ltr,
      softWrap: false
    );
  }
}