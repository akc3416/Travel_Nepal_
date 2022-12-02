import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/menu/widgets/ATM/custom_atm_widget.dart';

class PublicToiletList extends StatefulWidget {
  PublicToiletList({Key? key}) : super(key: key);

  @override
  _PublicToiletListState createState() => _PublicToiletListState();
}

class _PublicToiletListState extends State<PublicToiletList> {
  @override
  Widget build(BuildContext context) {
    final databaseList = Provider.of<List<DatabaseModel>>(context);
    if (databaseList.length == 0) {
      return Center(
        child: Text("Loading...."),
      );
    } else {
      List<DatabaseModel> temp = [];
      databaseList.map((data) {
        if (data.key == "restroom") {
          temp.add(data);
        }
      }).toList();

      return _body(publictoiletlist: temp[0].body.toString());
    }
  }

  Widget _body({required String publictoiletlist}) {
    return CustomATMWidget(location: publictoiletlist);
  }
}
