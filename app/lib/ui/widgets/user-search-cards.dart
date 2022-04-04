import 'package:app/domain/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableSearchCards extends StatelessWidget{
  
  final List<UserModel> listOfUsersFromSearch;

  const ReusableSearchCards({
    required this.listOfUsersFromSearch
  
  });
    @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //TODO: Add profile picture
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          height: 15,
        )
      ]),
      //This is for the background]
      GestureDetector(
        onTap: () {},
        child: Container(
          height: media.height * 0.25,
          // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(32),
            ),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  CircleAvatar(
                    radius: 20.0,
                    // backgroundColor: image == null ? Colors.grey[200] : null,
                    // backgroundImage: image != null
                    //     ? FileImage(image!) as ImageProvider
                    //     : null,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  
                  Column(
                    children: [
                  //    Text("${listOfUsersFromSearch.} ${userModel.lastName} "),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }

}

// class PopUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Popup Menu Example - FlutterCorner'),
//         backgroundColor: Colors.black,
//       ),
//       body: Center(
//         child: RaisedButton(
//           child: Text(
//             'Show Pop-up',
//             style: TextStyle(
//               color: Colors.white,
//             ),
//           ),
//           color: Colors.black,
//           onPressed: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) => _buildPopupDialog(context),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

