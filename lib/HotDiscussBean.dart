import 'package:flutter/widgets.dart';

class HotDiscussBean {
  final String topic;
  final String topicUrl;

  final List<HotDiscussItemBean> hots;

  HotDiscussBean(
      @required this.topic, @required this.topicUrl, @required this.hots);
}

class HotDiscussItemBean {
  final String image;
  final String title;
  final String desc;
  final String url;

  HotDiscussItemBean(@required this.image, @required this.title,
      @required this.desc, @required this.url);
}
