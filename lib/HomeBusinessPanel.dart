import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                    borderSide: BorderSide(
                      color: Color(0xffc7c7cc),
                      width: 1.0
                    ),
                  gapPadding: 0.2,
                ),
              ),
              style: new TextStyle(
                  fontSize: 16.0,
                  height: 2.0,
                  color: Color(0xff666666)
              )
          )
        ],
      ),
    );
  }
}
