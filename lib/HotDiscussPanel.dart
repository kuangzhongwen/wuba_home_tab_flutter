
import 'package:flutter/cupertino.dart';

class HotDiscussPanel extends StatefulWidget {

  @override
  State createState() {
    return _HotDiscussPanelState();
  }
}

class _HotDiscussPanelState extends State<HotDiscussPanel> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30, child: Row(
              children: <Widget>[
                Image.asset('images/home_hot_discuss.png', width: 37, height: 18)
              ],
          )
          ),
        ],
      ),
    );
  }
}