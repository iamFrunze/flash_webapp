import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:teacher_review/res/app_dimensions.dart';
import 'package:teacher_review/screens/widgets/tiles.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.title,
    this.subTitle,
    required this.listData,
    required this.addElement,
    required this.controller,
    required this.onTapCard,
    required this.appDimensions,
    required this.onDeleteElement,
  });

  final String title;
  final String? subTitle;
  final List<PersonModel> listData;
  final Function(String title) addElement;
  final Function(PersonModel person) onDeleteElement;
  final Function(PersonModel person) onTapCard;
  final AppDimensions appDimensions;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Добавить'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Назад'),
                ),
                TextButton(
                  onPressed: () {
                    addElement(controller.text);
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text('Добавить'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: appDimensions.padding(),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF35C4AF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    AutoSizeText(
                      title,
                      style: TextStyle(
                        color: const Color(0xFF003F49),
                        fontWeight: FontWeight.bold,
                        fontSize: appDimensions.textTitleSize(),
                      ),
                    ),
                    if (subTitle != null)
                      Text(
                        subTitle!,
                        style: TextStyle(
                          color: const Color(0xFF003F49),
                          fontWeight: FontWeight.bold,
                          fontSize: appDimensions.textSubTitleSize(),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: appDimensions.logoSize(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: appDimensions.padding(),
                ),
                child: TilesWidget(
                  key: ValueKey<String>(listData[index].uuid),
                  title: listData[index].name,
                  onTap: () => onTapCard(listData[index]),
                  onDelete: () => onDeleteElement(listData[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
