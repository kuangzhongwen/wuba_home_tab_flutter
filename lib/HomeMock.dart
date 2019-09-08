import 'package:wuba_home_tab_flutter/BussinessBean.dart';
import 'package:wuba_home_tab_flutter/HotDiscussBean.dart';
import 'package:wuba_home_tab_flutter/TribeEnterBean.dart';

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
      HotDiscussItemBean('images/home_hot_discuss_icon0.png', '急招职位', '快速入职',
          'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon1.png', '房东直租', '免收中介费',
          'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon2.png', '求职那些事', '找工作的门道',
          'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon3.png', '普工大家庭', '你是哪个厂的',
          'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon4.png', '万能求助圈', '寻人寻物求助',
          'https://58.com'),
      HotDiscussItemBean('images/home_hot_discuss_icon5.png', '美容美发圈', '烫染洗剪吹喽',
          'https://58.com')
    ]);
    return HotDiscussBean('楼市正式进入冰冻期，炒房者40套房子全部砸手上', 'https://58.com', hots);
  }

  static loadTribeEnter() {
    List<TribeBean> data = [];
    data.addAll([
      TribeBean(
          '朋友不拿自己当外人，该怎么办',
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567956157366&di=7efb4dcf0d595b8d505c1abc46b1fab0&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201809%2F26%2F20180926162125_vjbwi.jpg',
          'https://58.com'),
      TribeBean(
          '很多人在追女孩子的过程当中一直苦于不知道怎么和女生聊天，因为找不到谈恋爱和女生聊天话题，因此，每次想去找女朋友苦于聊天话题无法展开而止步。',
          'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1567956219951&di=9e87fd6a77eead467c17ace35349820f&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201802%2F25%2F20180225184943_ZRAdx.thumb.700_0.jpeg',
          'https://58.com'),
      TribeBean(
          '浪漫的度假作为你生活方式的一部分，你有何感受？',
          'https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1567946167&di=d292a5a8341808ac6d7baa6ea2fc47e2&src=http://b-ssl.duitang.com/uploads/item/201808/28/20180828105452_gxyay.thumb.700_0.jpg',
          'https://58.com')
    ]);
    return TribeEnterBean(data);
  }
}
