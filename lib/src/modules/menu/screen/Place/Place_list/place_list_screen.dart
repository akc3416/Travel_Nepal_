import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/menu/model/Places/places_model.dart';
import 'package:travel_nepal/src/modules/menu/widgets/Place/custom_place_widget.dart';

class PlaceListScreen extends StatefulWidget {
  PlaceListScreen({Key? key}) : super(key: key);

  @override
  _PlaceListScreenState createState() => _PlaceListScreenState();
}

class _PlaceListScreenState extends State<PlaceListScreen> {
  @override
  Widget build(BuildContext context) {
    final databaseList = Provider.of<List<DatabaseModel>>(context);
    List<PlacesModel> _placeList;
    if (databaseList.length == 0) {
      return Center(
        child: Text("Loading...."),
      );
    } else {
      List<DatabaseModel> temp = [];
      databaseList.map((data) {
        if (data.key == "place") {
          temp.add(data);
        }
      }).toList();
      _placeList = placesModelFromJson(temp[0].body.toString());

      return _body(placeList: _placeList, context: context);
    }
  }

  Widget _body(
      {required List<PlacesModel> placeList, required BuildContext context}) {
    return ListView.builder(
      itemCount: placeList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CustomPlaceWidget(
          customContext: context,
          placedata: placeList[index],
        );
      },
    );
  }
}
