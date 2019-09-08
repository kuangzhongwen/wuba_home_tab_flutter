
import 'package:flutter/material.dart';

class TribeEnterBean {

  List<TribeBean> data;

  TribeEnterBean(@required this.data);
}

class TribeBean {

  String content;
  String userHead;
  String url;

  TribeBean(@required this.content, @required this.userHead, @required this.url);
}
