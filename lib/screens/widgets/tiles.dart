import 'package:flutter/material.dart';

class TilesWidget extends StatelessWidget {
  const TilesWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.onDelete,
  });

  final String title;
  final GestureTapCallback onTap;
  final GestureTapCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: ListTile(
          onTap: onTap,
          trailing: IconButton(
            onPressed: onDelete,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
          tileColor: const Color(0xff54B7C6),
          title: Center(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
