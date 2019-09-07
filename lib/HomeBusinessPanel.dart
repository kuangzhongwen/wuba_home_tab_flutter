import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wuba_home_tab_flutter/BussinessBean.dart';

class HomeBussinessPanel extends StatefulWidget {
  @override
  State createState() {
    return _HomeBussinessState();
  }
}

class _HomeBussinessState extends State<HomeBussinessPanel> {
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          TextField(
              decoration: new InputDecoration(
                hintText: '房产',
                prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
                contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0xffc7c7cc), width: 1.0),
                  gapPadding: 0.2,
                ),
              ),
              style: new TextStyle(
                  fontSize: 16.0, height: 1.0, color: Color(0xff666666))),
          SizedBox(height: 250.0, child: _BussinessGridView())
        ],
      ),
    );
  }
}

class _BussinessGridView extends StatefulWidget {
  @override
  _BussinessGridViewState createState() => new _BussinessGridViewState();
}

class _BussinessGridViewState extends State<_BussinessGridView> {
  List<BussinessBean> _data = [];

  @override
  void initState() {
    _mockData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // 每行 5 列
            childAspectRatio: 1.0 // 显示区域宽高相等
            ),
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return _BussinessItemView(bussiness: _data[index]);
        });
  }

  void _mockData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _data.addAll([
          BussinessBean('images/home_new_icon_big_job.png', '全职招聘'),
          BussinessBean('images/home_new_icon_big_jianzhi.png', '兼职'),
          BussinessBean('images/home_new_icon_big_zufang.png', '租房'),
          BussinessBean('images/home_new_icon_big_house.png', '二手房'),
          BussinessBean('images/home_new_icon_big_sale.png', '二手物品'),
          BussinessBean('images/home_new_icon_big_car.png', '二手车'),
          BussinessBean('images/home_new_icon_big_shangjie.png', '本地服务'),
          BussinessBean('images/home_new_icon_big_shenghuo.png', '家政'),
          BussinessBean('images/home_new_icon_big_shangwu.png', '商务服务'),
          BussinessBean('images/home_new_icon_big_shangpu.png', '商铺写字楼'),
          BussinessBean('images/home_new_icon_small_daojia.png', '58到家'),
          BussinessBean('images/home_new_icon_small_jinrong.png', '借钱'),
          BussinessBean('images/home_new_icon_small_zhengzu.png', '新房'),
          BussinessBean('images/home_new_icon_small_xinchebx.png', '新车'),
          BussinessBean('images/home_new_icon_small_more.png', '更多')
        ]);
      });
    });
  }
}

class _BussinessItemView extends StatefulWidget {
  final BussinessBean bussiness;

  _BussinessItemView({this.bussiness});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<_BussinessItemView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Image.asset(widget.bussiness.image, width: 30, height: 30),
        ),
        Center(
          child: Text(widget.bussiness.text,
              style: new TextStyle(
                  fontSize: 12.0, height: 2.0, color: Color(0xff1a1a1a))),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
