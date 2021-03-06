import 'package:flutter/material.dart';
import 'package:flutter_from_0to1_demo/feed_list/ugc_banner.dart';
import 'package:flutter_from_0to1_demo/feed_list/ugc_item_view.dart';
import 'package:flutter_from_0to1_demo/feed_list/ugc_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UGCStaggeredView extends StatefulWidget {
  @override
  _UGCStaggeredViewState createState() => _UGCStaggeredViewState();
}

class _UGCStaggeredViewState extends State<UGCStaggeredView> {

  UGCModel _model;

  @override
  void initState() {
    super.initState();
    _model = DataUtil.getUGCModel();
  }

  _getSpan(int index) {
    if (index == 0) {
      return 2;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return UGCBanner(
                onPageSelected: (s) {
                  print('选中：$s');
                },
                onPageClicked: (c) {
                  print('点击：$c');
                },
              );
            } else {
              return UGCItem(_model.cards[index].card_info);
            }
          },
          staggeredTileBuilder: (int index) => StaggeredTile.fit(_getSpan(index)),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
