// import 'package:flutter/material.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

// class CustomNavBarWidget extends StatelessWidget {
//   final int selectedIndex;
//   final List<PersistentBottomNavBarItem>
//       items; // NOTE: You CAN declare your own model here instead of `PersistentBottomNavBarItem`.
//   final ValueChanged<int> onItemSelected;
//   CustomNavBarWidget({
//     Key? key,
//     required this.selectedIndex,
//     required this.items,
//     required this.onItemSelected,
//   });

//   Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
//     return Container(
//       alignment: Alignment.center,
//       height: 60.0,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Flexible(
//             child: IconTheme(
//               data: IconThemeData(
//                   size: 26.0,
//                   color: isSelected
//                       ? (item.activeColorSecondary == null
//                           ? item.activeColorPrimary
//                           : item.activeColorSecondary)
//                       : item.inactiveColorPrimary == null
//                           ? item.activeColorPrimary
//                           : item.inactiveColorPrimary),
//               child: item.icon,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Material(
//               type: MaterialType.transparency,
//               child: FittedBox(
//                   child: Text(
//                 item.title,
//                 style: TextStyle(
//                     color: isSelected
//                         ? (item.activeColorSecondary == null
//                             ? item.activeColorPrimary
//                             : item.activeColorSecondary)
//                         : item.inactiveColorPrimary,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 12.0),
//               )),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
