import 'package:flutter/widgets.dart';
import 'icon_item.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<ServiceItemViewModel> iconList = [
    ServiceItemViewModel(title: '全职招聘', icon: _image("publish_icon_house")),
    ServiceItemViewModel(
        title: '简直', icon: _image("publish_icon_house_zufang")),
    ServiceItemViewModel(
        title: '租房', icon: _image("publish_icon_qiuzuqiugouqiufuwu")),
    ServiceItemViewModel(title: '二手房', icon: _image("publish_icon_sale")),
    ServiceItemViewModel(title: '二手物品', icon: _image("publish_icon_zhaopin"))
  ];

  static Widget _image(String iconName) {
    return Image.asset(
      'images/${iconName}.png',
      width: 60,
      height: 60,
    );
  }

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
//        new GridView.count(
//          crossAxisCount: 5,
//          padding: EdgeInsets.symmetric(vertical: 0),
//          children: iconList.map((item) => IconItem(data: item)).toList(),
//        )
      ]
    );
  }
}
