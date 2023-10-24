import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher_review/screens/widgets/tiles.dart';
import 'package:teacher_review/utils/app_settings.dart';

class AddStudentWebScreen extends StatelessWidget {
  const AddStudentWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<AppSettings>(context);
    final reader = Provider.of<AppSettings>(context, listen: false);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 5),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: watcher.teachers.length,
          itemBuilder: (BuildContext context, int index) {
            return TilesWidget(
              title: watcher.teachers[index].title,
              subTitle: watcher.teachers[index].subTitle,
            );
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          final FIOController = TextEditingController();
          final descController = TextEditingController();
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Добавить учителя'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: FIOController,
                  ),
                  TextField(
                    controller: descController,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    reader.addTeacher(FIOController.text, descController.text);
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        child: const Text('Добавить преподавателя'),
      ),
    );
  }
}
