import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/custom/ScrollBehavior.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/core/widget/custom_expanded_panel.dart';
import 'package:travel_nepal/src/modules/menu/model/TourAndTravel/tourandtravelmodel.dart';
import 'package:travel_nepal/src/modules/menu/widgets/TourandTravel/custom_tour_and_travel_widget.dart';

class TourAndTravelListScreen extends StatefulWidget {
  TourAndTravelListScreen({Key? key}) : super(key: key);

  @override
  _TourAndTravelListScreenState createState() =>
      _TourAndTravelListScreenState();
}

class _TourAndTravelListScreenState extends State<TourAndTravelListScreen> {
  TextEditingController controller = new TextEditingController();
  String search_t = "";
  @override
  Widget build(BuildContext context) {
    final databaseList = Provider.of<List<DatabaseModel>>(context);
    List<TourAndTravelModel> _tourandtravellist;
    if (databaseList.length == 0) {
      return Center(
        child: Text("Loading...."),
      );
    } else {
      List<DatabaseModel> temp = [];
      databaseList.map((data) {
        if (data.key == "tourandtravel") {
          temp.add(data);
        }
      }).toList();
      _tourandtravellist = tourAndTravelModelFromJson(temp[0].body.toString());

      return _body(tourandtravellist: _tourandtravellist);
    }
  }

  Widget _body({required List<TourAndTravelModel> tourandtravellist}) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            new Container(
              child: new Padding(
                padding: const EdgeInsets.all(5),
                child: new Card(
                  elevation: 4.0,
                  child: new ListTile(
                    leading: new Icon(Icons.search),
                    title: new TextField(
                      controller: controller,
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                      onChanged: (val) {
                        setState(() {
                          search_t = val;
                        });
                      },
                    ),
                    trailing: new IconButton(
                      icon: new Icon(Icons.cancel),
                      onPressed: () {
                        controller.clear();
                        search_t = "";
                      },
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: tourandtravellist.length,
              itemBuilder: (BuildContext context, int index) {
                if (tourandtravellist[index]
                        .address
                        .toLowerCase()
                        .contains(search_t.toLowerCase().trim()) ==
                    true) {
                  return CustomTourAndTravelWidget(
                    customContext: context,
                    tourandtraveldata: tourandtravellist[index],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
