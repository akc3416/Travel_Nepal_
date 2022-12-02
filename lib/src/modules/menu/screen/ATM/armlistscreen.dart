import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/LocationModel.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/menu/widgets/ATM/custom_atm_widget.dart';

class ATMListScreen extends StatefulWidget {
  ATMListScreen({Key? key}) : super(key: key);

  @override
  _ATMListScreenState createState() => _ATMListScreenState();
}

class _ATMListScreenState extends State<ATMListScreen> {
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
        if (data.key == "atm") {
          temp.add(data);
        }
      }).toList();

      return _body(atmlist: temp[0].body.toString());
    }
  }

  Widget _body({required String atmlist}) {
    return CustomATMWidget(location: atmlist);
  }
}
