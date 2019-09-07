
import 'package:wuba_home_tab_flutter/BussinessBean.dart';

class HomeMock {

    static loadHomeBussiness() {
      List<BussinessBean> _data = [];
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
      return _data;
    }
}