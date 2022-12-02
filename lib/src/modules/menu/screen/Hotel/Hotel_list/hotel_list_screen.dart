import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_nepal/src/core/model/database_model.dart';
import 'package:travel_nepal/src/modules/menu/model/Hotel/hotel_model.dart';
import 'package:travel_nepal/src/modules/menu/widgets/Hotel/custom_hotel_card_widget.dart';

class HotelListScreen extends StatefulWidget {
  HotelListScreen({Key? key}) : super(key: key);

  @override
  _HotelListScreenState createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  TextEditingController controller = new TextEditingController();
  String search_t = "";
  @override
  Widget build(BuildContext context) {
    final databaseList = Provider.of<List<DatabaseModel>>(context);
    List<HotelModel> _hotelList;
    if (databaseList.length == 0) {
      return Center(
        child: Text("Loading...."),
      );
    } else {
      List<DatabaseModel> temp = [];
      databaseList.map((data) {
        if (data.key == "hotel") {
          temp.add(data);
        }
      }).toList();
      _hotelList = hotelModelFromJson(temp[0].body.toString());

      return _body(hotelList: _hotelList);
    }
  }

  Widget _body({required List<HotelModel> hotelList}) {
    return Column(
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
          physics: BouncingScrollPhysics(),
          itemCount: hotelList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            if (hotelList[index]
                .location
                .toLowerCase()
                .contains(search_t.toLowerCase())) {
              return CustomHotelCardWidget(
                  customContext: context, hotellist: hotelList[index]);
            } else if (search_t == "") {
              return CustomHotelCardWidget(
                  customContext: context, hotellist: hotelList[index]);
            }
            return Container();
          },
        ),
      ],
    );
  }
}
