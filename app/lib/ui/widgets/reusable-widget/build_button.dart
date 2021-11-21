import 'package:flutter/material.dart';
class BuildButton extends StatelessWidget{
    final String title;
    final IconData icon;
    final VoidCallback onClicked;

    BuildButton({
    required this.title,
    required this.icon, 
    required this.onClicked,
    });


  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepPurpleAccent,
        onPrimary: Colors.white,
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text(title),
      // child: Row(
      //   children: [
      //     Icon(icon, size: 28),
      //     const SizedBox(
      //       width: 16,
      //     ),
      //     Text(title)
      //   ],
      // ),
      onPressed: onClicked,
    );
  }
}