

import 'house_rent_list.dart';

class HouseState  {

  HouseState();

  String? houseStatusDes = '(西区)';
  String? houseId = '房屋编号';
  int? status = 1;
  String? houseNumber = '3号楼-2单元';
  String? houseDetailAddress = '京旺家园一区-5-401';
  String? houseTypeAndArea = '120平 南向';
  String? rentPrice = '4000/月';
  String? contractor = '张三';
  List<HouseTag> tags = List.generate(3, (index) => HouseTag());

  HouseState.fromJson(dynamic json) {
    houseStatusDes = json['houseStatusDes'];
    houseId = json['houseId'];
    status = json['status'];
    houseNumber = json['houseNumber'];
    houseDetailAddress = json['houseDetailAddress'];
    houseTypeAndArea = json['houseTypeAndArea'];
    rentPrice = json['rentPrice'];
    contractor = json['contractor'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags.add(HouseTag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['houseStatusDes'] = houseStatusDes;
    map['status'] = status;
    map['houseNumber'] = houseNumber;
    map['houseDetailAddress'] = houseDetailAddress;
    map['houseTypeAndArea'] = houseTypeAndArea;
    map['rentPrice'] = rentPrice;
    map['contractor'] = contractor;
    map['houseId'] = houseId;
    if (tags != null) {
      map['tags'] = tags.map((v) => v.toJson()).toList();
    }
    return map;
  }

  get backgroundColor => getStatusBackgroundColor(status);

  get topColor => getStatusTopColor(status);

  HouseState clone() {
    return HouseState()
      ..houseStatusDes = houseStatusDes
      ..houseId = houseId
      ..status = status
      ..houseNumber = houseNumber
      ..houseDetailAddress = houseDetailAddress
      ..houseTypeAndArea = houseTypeAndArea
      ..rentPrice = rentPrice
      ..contractor = contractor
      ..tags = tags;
  }
}
