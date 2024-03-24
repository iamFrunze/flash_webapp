import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class TilesWidget extends StatelessWidget {
  const TilesWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.onDelete,
    this.id,
  });

  final String title;
  final GestureTapCallback onTap;
  final GestureTapCallback onDelete;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: id != null
              ? IconButton(
                  icon: const Icon(Icons.share_rounded),
                  color: Colors.white,
                  onPressed: () async {


                    Share.share(
                        'https://flash-webapp-8b454.web.app/#/student/$id' ??
                            '');
                    Clipboard.setData(ClipboardData(
                        text:
                        'https://flash-webapp-8b454.web.app/#/student/$id' ??
                            ''));
                       ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Скопировано'),
                        ),
                    );
                  },
                )
              : null,
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
