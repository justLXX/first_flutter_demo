import 'package:flutter/material.dart';

/// pageNo : 1
/// totalPage : 20
/// pageSize : 10
/// totalRecord : 100
/// communityList : [{"communityName":"龙泽小区（西区）","houseList":[{"houseStatusDes":"装修中","backgroundColor":"#FF4D13","topColor":"#FF0000","houseNumber":"房源编号","houseDetailAddress":"楼栋-单元-户室号","houseTypeAndArea":"3室1厅2卫｜120m²","rentPrice":"￥3000/月","contractor":"签约人","tags":[{"content":"空","backgroundColor":"#FF4D13"}]}]}]


/// communityName : "龙泽小区（西区）"
/// houseList : [{"houseStatusDes":"装修中","backgroundColor":"#FF4D13","topColor":"#FF0000","houseNumber":"房源编号","houseDetailAddress":"楼栋-单元-户室号","houseTypeAndArea":"3室1厅2卫｜120m²","rentPrice":"￥3000/月","contractor":"签约人","tags":[{"content":"空","backgroundColor":"#FF4D13"}]}]

/// houseStatusDes : "装修中"
/// backgroundColor : "#FF4D13"
/// topColor : "#FF0000"
/// houseNumber : "房源编号"
/// houseDetailAddress : "楼栋-单元-户室号"
/// houseTypeAndArea : "3室1厅2卫｜120m²"
/// rentPrice : "￥3000/月"
/// contractor : "签约人"
/// tags : [{"content":"空","backgroundColor":"#FF4D13"}]

/// content : "空"
/// backgroundColor : "#FF4D13"

class HouseTag with HouseTagColorMixin {
  HouseTag({this.content});

  HouseTag.fromJson(dynamic json) {
    content = json['content'];
  }

  String? content;

  Color get backgroundColor => getHouseTagColor(this);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    return map;
  }
}

mixin HouseTagColorMixin {
  static const TAG_EMPTY = '空';
  static const TAG_PUSH = '推';
  static const TAG_FIX = '装';
  static const TAG_RESERVE = '定';
  static const TAG_OVER_TIME = '逾';
  static const TAG_LEAVE = '离';
  static const TAG_EXPIRE = '已';

  Color getHouseTagColor(HouseTag tag) {
    switch (tag.content) {
      case TAG_EMPTY:
        return Color(0xFFFF4D13);
      case TAG_PUSH:
        return Color(0xFF2ECACE);
      case TAG_FIX:
        return Color(0xFF324795);
      case TAG_RESERVE:
        return Color(0xFFFF8000);
      case TAG_OVER_TIME:
        return Color(0xFFFF1241);
      case TAG_LEAVE:
        return Color(0xFF3365FF);
      case TAG_EXPIRE:
        return Color(0xFFFF1241);
    }
    return Color(0xFF4D13);
  }
}

/// 空置
const int HOUSE_STATUS_EMPTY = 1;

/// 成租
const int HOUSE_STATUS_COMPLETE = 2;

/// 预订
const int HOUSE_STATUS_RESERVE = 3;

/// 配置中
const int HOUSE_STATUS_CONFIG = 4;

/// 不可租
const int HOUSE_STATUS_INVALIDATE = 5;

class HouseStatusColor {
  final Color topColor;

  final Color backgroundColor;

  HouseStatusColor({required this.topColor, required this.backgroundColor});
}

final StatusColorMap = {
  HOUSE_STATUS_EMPTY: HouseStatusColor(backgroundColor: Color(0xFFFFF1F1), topColor: Color(0xFFFF4D13)),
  HOUSE_STATUS_COMPLETE: HouseStatusColor(backgroundColor: Color(0xFFE6F7F3), topColor: Color(0xFF0CB389)),
  HOUSE_STATUS_RESERVE: HouseStatusColor(backgroundColor: Color(0xFFFFF3E6), topColor: Color(0xFFFF8000)),
  HOUSE_STATUS_CONFIG: HouseStatusColor(backgroundColor: Color(0xFFEDF1FF), topColor: Color(0xFF324795)),
  HOUSE_STATUS_INVALIDATE: HouseStatusColor(backgroundColor: Color(0xFFF6F6F6), topColor: Color(0xFFAAAAAA)),
};

Color getStatusBackgroundColor(int? status) => StatusColorMap[status!]?.backgroundColor ?? Color(0xF6F6F6);

Color getStatusTopColor(int? status) => StatusColorMap[status!]?.topColor ?? Color(0xF6F6F6);
