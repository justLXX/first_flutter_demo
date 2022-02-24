import 'package:flutter/material.dart';

import 'house_rent_list.dart';
import 'house_state.dart';

Widget buildView() {

  HouseState state = HouseState();

  return DefaultTextStyle.merge(
    maxLines: 1,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        color: state.backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTopColorWidget(state),
          buildDetailAddress(state),
          buildHouseTypeAndArea(state),
          buildHouseRentPrice(state),
          Expanded(child: Container()),
          buildTags(state.tags),
        ],
      ),
    ),
  );
}

buildTopColorWidget(HouseState state) => Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 20,
      child: Center(
        child: Text(
          state.houseNumber!,
          style: TextStyle(fontSize: 12, color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(2),
          topRight: Radius.circular(2),
        ),
        color: state.topColor,
      ),
    );

buildDetailAddress(HouseState state) => Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 0),
      child: Text(
        state.houseDetailAddress!,
        style: TextStyle(fontSize: 14, color: Color(0xFF333333), fontWeight: FontWeight.w500),
      ),
    );

buildHouseTypeAndArea(HouseState state) => Padding(
    padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 0),
    child: Text(
      state.houseTypeAndArea!,
      style: TextStyle(
        fontSize: 13,
        color: Color(0xFF333333),
      ),
    ));

buildHouseRentPrice(HouseState state) => Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            state.rentPrice!,
            style: TextStyle(fontSize: 13, color: Color(0xFF333333)),
            maxLines: 1,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                state.contractor!,
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF999999),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );

buildHouseTag(HouseTag tag) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(1)),
        color: tag.backgroundColor,
      ),
      padding: EdgeInsets.all(2),
      child: Center(
        child: Text(
          '空',
          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500, height: 1),
        ),
      ),
    );

buildTags(List<HouseTag> tags) => SingleChildScrollView(
  child:   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: tags
              .map((e) => Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: buildHouseTag(e),
                  ))
              .toList(),
        ),
      ),
);
