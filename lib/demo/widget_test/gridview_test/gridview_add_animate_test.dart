import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'house_state.dart';
import 'house_view.dart';

class GridviewTest extends StatelessWidget {
  const GridviewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      cacheExtent: 0,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              height: 36,
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    text: '龙泽小区',
                    style: TextStyle(color: Color(0xFF333333), fontSize: 13),
                    children: [
                      TextSpan(
                        text: '(西区)',
                        style: TextStyle(color: Color(0xFF999999), fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
            ),

            GridView.builder(
              cacheExtent: 0,
              itemCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 112/120,
                    mainAxisSpacing: 5.5,
                    crossAxisSpacing: 5.5, maxCrossAxisExtent: 150
                ),
              itemBuilder: (BuildContext context, int index) {
                return buildView();
              },
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 20,
        );
      }, itemCount: 1000,
    );
  }
}
