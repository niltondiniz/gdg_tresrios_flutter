import 'package:flutter/material.dart';

class ItemInformation extends StatelessWidget {
  const ItemInformation({
    Key key,
    this.title,
    this.data,
  }) : super(key: key);

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            this.title,
            overflow: TextOverflow.fade,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            this.data,
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
