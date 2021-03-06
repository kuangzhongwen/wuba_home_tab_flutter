import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wuba_home_tab_flutter/BussinessBean.dart';
import 'package:wuba_home_tab_flutter/HomeMock.dart';
import 'package:wuba_home_tab_flutter/UIConstants.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: 40,
              child: TextField(
                  decoration: new InputDecoration(
                      hintText: '房产',
                      prefixIcon: Icon(Icons.search, color: Colors.deepOrange),
                      suffixIcon: Icon(Icons.archive, color: Colors.black38),
                      contentPadding: const EdgeInsets.symmetric(vertical: 1.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide:
                            BorderSide(color: Color(0xffc7c7cc), width: 1.0),
                        gapPadding: 0.2,
                      )),
                  style: new TextStyle(
                      fontSize: 16.0, height: 1.0, color: Color(UIConstants.PRIMARY_TEXT_COLOR)))),
          SizedBox(height: 216.0, child: _BussinessGridView())
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
    _ReceiveData();
  }

  void _ReceiveData() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _data = HomeMock.loadHomeBussiness();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // 每行 5 列
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 5,
            childAspectRatio: 1.1),
        physics: NeverScrollableScrollPhysics(), // 禁用滚动事件
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return _BussinessItemView(bussiness: _data[index]);
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
                  fontSize: 12.0, height: 2.0, color: Color(UIConstants.PRIMARY_TEXT_DARK_COLOR)))
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
