import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RowTile extends StatelessWidget {
  RowTile({
    required this.text1,
    required this.text2,
  });

  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.29,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text2,
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
