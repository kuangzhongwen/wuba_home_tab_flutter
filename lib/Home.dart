import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Image.asset(
          'images/ic_home_banner.png',
        ),
        new Row(
          children: [
            new Image.asset(
              'images/publish_icon_zhaopin.png',
            ),
            new Image.asset(
              'images/publish_icon_qiuzuqiugouqiufuwu.png',
            ),
            new Image.asset(
              'images/publish_icon_house_zufang.png',
            ),
            new Image.asset(
              'images/publish_icon_house.png',
            ),
            new Image.asset(
              'images/publish_icon_sale.png',
            )
          ],
        )
      ],
    );
  }
}
