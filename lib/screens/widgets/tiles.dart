import 'package:flutter/material.dart';

class TilesWidget extends StatelessWidget {
  const TilesWidget({super.key, required this.title, required this.subTitle,});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
      ),
    );
  }
}
