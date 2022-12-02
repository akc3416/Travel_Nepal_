import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/menu/model/Guide/guide_mode.dart';
import 'package:travel_nepal/src/modules/menu/widgets/Guide/custom_guide_widget.dart';

class GuideListScreen extends StatefulWidget {
  GuideListScreen({Key? key}) : super(key: key);

  @override
  _GuideListScreenState createState() => _GuideListScreenState();
}

class _GuideListScreenState extends State<GuideListScreen> {
  @override
  Widget build(BuildContext context) {
    final databaseList = Provider.of<List<DatabaseModel>>(context);
    List<GuideModel> _guideList;
    if (databaseList.length == 0) {
      return Center(
        child: Text("Loading...."),
      );
    } else {
      List<DatabaseModel> temp = [];
      databaseList.map((data) {
        if (data.key == "guide") {
          temp.add(data);
        }
      }).toList();
      _guideList = guideModelFromJson(temp[0].body.toString());

      return _body(guidelist: _guideList);
    }
  }

  Widget _body({required List<GuideModel> guidelist}) {
    return ListView.builder(
      itemCount: guidelist.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return CustomGuideWidget(guidedata: guidelist[index]);
      },
    );
  }
}
