import 'package:wuba_home_tab_flutter/BussinessBean.dart';
import 'package:wuba_home_tab_flutter/HotDiscussBean.dart';

class HomeMock {
  static loadHomeBussiness() {
    List<BussinessBean> data = [];
    data.addAll([
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
    return data;
  }

  static loadHotDiscuss() {
    List<HotDiscussItemBean> hots = [];
    hots.addAll([
      HotDiscussItemBean('images/home_hot_discuss_icon0.png', '急招职位', '快速入职', 'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon1.png', '房东直租', '免收中介费', 'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon2.png', '求职那些事', '找工作的门道', 'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon3.png', '普工大家庭', '你是哪个厂的', 'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon4.png', '万能求助圈', '寻人寻物求助', 'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon5.png', '美容美发圈', '烫染洗剪吹喽', 'https://58.com')
    ]);
    return HotDiscussBean('楼市正式进入冰冻期，炒房者40套房子全部砸手上', 'https://58.com', hots);
  }
}
