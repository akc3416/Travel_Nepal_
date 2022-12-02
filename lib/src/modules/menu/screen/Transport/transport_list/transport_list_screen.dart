import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/menu/model/Transport/transport_model.dart';
import 'package:travel_nepal/src/modules/menu/widgets/Transport/custom_transport_widget.dart';
import 'package:travel_nepal/src/shared/preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class TransportListScreen extends StatefulWidget {
  final int type;
  TransportListScreen({Key? key, required this.type}) : super(key: key);

  @override
  _TransportListScreenState createState() => _TransportListScreenState();
}

class _TransportListScreenState extends State<TransportListScreen> {
  @override
  Widget build(BuildContext context) {
    final databaseList = Provider.of<List<DatabaseModel>>(context);
    List<TransportModel> _trasportList;
    if (databaseList.length == 0) {
      return Center(
        child: Text("Loading...."),
      );
    } else {
      List<DatabaseModel> temp = [];
      databaseList.map((data) {
        if (data.key == "transport") {
          temp.add(data);
        }
      }).toList();
      _trasportList = transportModelFromJson(temp[0].body.toString());

      return _body(trasportList: _trasportList);
    }
  }

  Widget _body({required List<TransportModel> trasportList}) {
    return ListView.builder(
      itemCount: trasportList.length,
      itemBuilder: (BuildContext context, int index) {
        if (trasportList[index].twofour == widget.type) {
          return CustomTransportWidget(
              customContext: context, transportList: trasportList[index]);
        } else if (trasportList[index].twofour == widget.type) {
          return CustomTransportWidget(
              customContext: context, transportList: trasportList[index]);
        }
        return Container();
      },
    );
  }
}
